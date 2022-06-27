import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/asklora/asklora_api_client.dart';
import '../../../../core/utils/extensions.dart';

part 'otp_state.dart';

part 'otp_event.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final int resetTime;

  OtpBloc({required this.resetTime}) : super(const OtpState()) {
    on<OtpInputChanged>(_onOtpInputChanged);
    on<OtpSubmitted>(_onSignInSubmitted);
    on<OtpRequested>(_onOtpRequested);
  }

  void _onOtpRequested(OtpRequested event, Emitter<OtpState> emit) async {
    debugPrint('EMAIL ${event.email}');
    emit(state.copyWith(disableRequest: true, resetTime: resetTime));
    await emit.onEach<int>(
      ticker(),
      onData: (timeLeft) {
        if (timeLeft == 0) {
          emit(state.copyWith(disableRequest: false, resetTime: timeLeft));
        } else {
          emit(state.copyWith(disableRequest: true, resetTime: timeLeft));
        }
      },
    );
  }

  void _onOtpInputChanged(OtpInputChanged event, Emitter<OtpState> emit) {
    emit(state.copyWith(
        status: OtpStatus.unknown,
        otp: event.otp,
        isOtpValid: event.otp.isValidOtp(),
        textPosition: event.textPosition,
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

  Stream<int> ticker() {
    return Stream<int>.periodic(
        const Duration(seconds: 1), (x) => resetTime - x - 1).take(resetTime);
  }
}
