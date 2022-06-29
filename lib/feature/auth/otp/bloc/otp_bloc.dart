import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/domain/otp/get_otp_request.dart';
import '../../../../core/domain/otp/verify_otp_request.dart';
import '../repository/otp_repository.dart';

part 'otp_state.dart';

part 'otp_event.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final OtpRepository _otpRepository;
  final int _resetTime = 5;
  StreamSubscription? resetTimeStreamSubscription;

  OtpBloc({
    required OtpRepository otpRepository,
  })  : _otpRepository = otpRepository,
        super(const OtpState()) {
    on<OtpSubmitted>(_onOtpSubmitted);
    on<OtpRequested>(_onOtpRequested);
    on<OtpTimeResetUpdate>(_onOtpTimeResetUpdate);
  }

  void _onOtpRequested(OtpRequested event, Emitter<OtpState> emit) async {
    try {
      emit(state.copyWith(status: OtpStatus.loading));
      await _otpRepository.getOtp(
          getOtpRequest: GetOtpRequest(event.email, OtpType.register.value));
      emit(state.copyWith(
          status: OtpStatus.unknown,
          disableRequest: true,
          resetTime: _resetTime));

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

  void _onOtpSubmitted(
    OtpSubmitted event,
    Emitter<OtpState> emit,
  ) async {
    try {
      emit(state.copyWith(status: OtpStatus.loading));
      await _otpRepository.verifyOtp(verifyOtpRequest: event.verifyOtpRequest);
      cancelStreamSubscription();
      emit(state.copyWith(
          status: OtpStatus.success, responseMessage: 'Verify OTP Success'));
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
        const Duration(seconds: 1), (x) => _resetTime - x).take(_resetTime);
  }

  void cancelStreamSubscription() {
    if (resetTimeStreamSubscription != null) {
      resetTimeStreamSubscription!.cancel();
    }
  }

  @override
  Future<void> close() {
    cancelStreamSubscription();
    return super.close();
  }
}
