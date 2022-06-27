import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/domain/otp/get_otp_request.dart';
import '../../../../core/domain/otp/verify_otp_request.dart';
import '../../../../core/utils/extensions.dart';
import '../repository/otp_repository.dart';

part 'otp_state.dart';

part 'otp_event.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpRepository _otpRepository;
  final int resetTime;
  late StreamSubscription resetTimeStreamSubscription;

  OtpBloc({
    required OtpRepository otpRepository,
    required this.resetTime,
  })  : _otpRepository = otpRepository,
        super(const OtpState()) {
    on<OtpInputChanged>(_onOtpInputChanged);
    on<OtpSubmitted>(_onOtpSubmitted);
    on<OtpRequested>(_onOtpRequested);
    on<OtpTimeResetUpdate>(_onOtpTimeResetUpdate);
  }

  void _onOtpRequested(OtpRequested event, Emitter<OtpState> emit) async {
    try {
      emit(state.copyWith(status: OtpStatus.requestLoading));
      await _otpRepository.getOtp(getOtpRequest: event.getOtpRequest);
      emit(state.copyWith(
          disableRequest: true,
          resetTime: resetTime,
          status: OtpStatus.unknown));

      resetTimeStreamSubscription = ticker().listen((_) {
        add(const OtpTimeResetUpdate());
      });
    } on NotFoundException {
      emit(state.copyWith(
          status: OtpStatus.failure,
          responseMessage: 'User does not exist with the given email'));
    } catch (e) {
      emit(state.copyWith(
          status: OtpStatus.failure, responseMessage: e.toString()));
    }
  }

  void _onOtpTimeResetUpdate(OtpTimeResetUpdate event, Emitter<OtpState> emit) {
    emit(state.copyWith(
        disableRequest: state.resetTime == 1 ? false : true,
        resetTime: state.resetTime - 1,
        status: OtpStatus.unknown));
  }

  void _onOtpInputChanged(OtpInputChanged event, Emitter<OtpState> emit) {
    emit(state.copyWith(
        status: OtpStatus.unknown,
        otp: event.otp,
        isOtpValid: (event.otp.isValidOtp() || event.otp.isEmpty),
        textPosition: event.textPosition,
        otpErrorText: (event.otp.isValidOtp() || event.otp.isEmpty)
            ? ''
            : 'Enter valid otp (exactly 6 digits)'));
  }

  void _onOtpSubmitted(
    OtpSubmitted event,
    Emitter<OtpState> emit,
  ) async {
    try {
      resetTimeStreamSubscription.cancel();
      emit(state.copyWith(status: OtpStatus.verifyLoading));
      await _otpRepository.verifyOtp(verifyOtpRequest: event.verifyOtpRequest);
      emit(state.copyWith(
          status: OtpStatus.submitSuccess,
          responseMessage: 'Verify OTP Success'));
    } on UnauthorizedException {
      emit(state.copyWith(
          status: OtpStatus.failure, responseMessage: 'Invalid OTP'));
    } catch (e) {
      emit(state.copyWith(
          status: OtpStatus.failure, responseMessage: e.toString()));
    }
  }

  Stream<int> ticker() {
    return Stream<int>.periodic(
        const Duration(seconds: 1), (x) => resetTime - x).take(resetTime);
  }

  @override
  Future<void> close() {
    resetTimeStreamSubscription.cancel();
    return super.close();
  }
}
