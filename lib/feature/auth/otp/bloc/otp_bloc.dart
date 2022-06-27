import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/utils/extensions.dart';

part 'otp_state.dart';

part 'otp_event.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(const OtpState()) {
    on<OtpInputChanged>(_onOtpInputChanged);
    on<OtpSubmitted>(_onSignInSubmitted);
  }

  void _onOtpInputChanged(OtpInputChanged event, Emitter<OtpState> emit) {
    emit(state.copyWith(
        status: OtpStatus.unknown,
        otp: event.otp,
        isOtpValid: event.otp.isValidOtp(),
        otpErrorText: (event.otp.isValidOtp() || event.otp.isEmpty)
            ? ''
            : 'Enter valid otp (exactly 6 digits)'));
  }

  void _onSignInSubmitted(
    OtpSubmitted event,
    Emitter<OtpState> emit,
  ) async {
    try {
      emit(state.copyWith(status: OtpStatus.loading));
      emit(state.copyWith(
          status: OtpStatus.success, responseMessage: 'OTP Success'));
    } on UnauthorizedException {
      emit(state.copyWith(
          status: OtpStatus.failure, responseMessage: 'Invalid OTP'));
    } catch (e) {
      emit(state.copyWith(
          status: OtpStatus.failure, responseMessage: e.toString()));
    }
  }
}
