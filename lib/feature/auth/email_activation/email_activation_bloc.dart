import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';

import '../../../core/domain/base_response.dart';
import '../../../core/domain/otp/get_otp_request.dart';
import '../../../core/domain/token/repository/token_repository.dart';
import '../sign_up/repository/sign_up_repository.dart';

part 'email_activation_event.dart';

part 'email_activation_state.dart';

class EmailActivationBloc
    extends Bloc<EmailActivationEvent, EmailActivationState> {
  EmailActivationBloc(this._signUpRepository, this._tokenRepository)
      : super(const EmailActivationState()) {
    on<ResendEmailActivationLink>(_onResendEmailActivationLink);
    _incomingLinkHandler();
  }

  final SignUpRepository _signUpRepository;
  final TokenRepository _tokenRepository;
  StreamSubscription? _streamSubscription;

  void _onResendEmailActivationLink(
    ResendEmailActivationLink event,
    Emitter<EmailActivationState> emit,
  ) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));

      await _signUpRepository.getVerificationEmail(
          getVerificationEmailRequest:
              GetOtpRequest(event.email, OtpType.register.value));
      emit(state.copyWith(
          response: BaseResponse.complete(
              message: 'Email verification link has been sent successfully!',
              null)));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error(e.toString())));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  void _incomingLinkHandler() async {
    try {
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (uri != null && uri.queryParameters['state'] == 'success') {
          if (uri.queryParameters['token'] != null) {
            _tokenRepository.saveSignUpToken(uri.queryParameters['token']!);
            emit(state.copyWith(deeplinkStatus: DeeplinkStatus.success));
          }
        }
        emit(state.copyWith(deeplinkStatus: DeeplinkStatus.failed));
      }, onError: (Object err) {
        emit(state.copyWith(deeplinkStatus: DeeplinkStatus.failed));
      });
    } on PlatformException {
      emit(state.copyWith(deeplinkStatus: DeeplinkStatus.failed));
    } on FormatException catch (err) {
      emit(state.copyWith(deeplinkStatus: DeeplinkStatus.failed));
    }
  }
}
