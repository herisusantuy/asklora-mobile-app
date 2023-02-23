import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/token/repository/token_repository.dart';
import '../../../../core/utils/extensions.dart';
import '../repository/forgot_password_repository.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(
      {required ForgotPasswordRepository forgotPasswordRepository,
      required TokenRepository tokenRepository})
      : _forgotPasswordRepository = forgotPasswordRepository,
        _tokenRepository = tokenRepository,
        super(const ForgotPasswordState()) {
    on<ForgotPasswordEmailChanged>(_onEmailChanged);
    on<ForgotPasswordSubmitted>(_onForgotPasswordSubmitted);
    on<StartListenOnDeeplink>(_onStartListenOnDeeplink);
    on<DeepLinkValidateSuccess>(_onDeepLinkValidateSuccess);
  }

  final ForgotPasswordRepository _forgotPasswordRepository;
  final TokenRepository _tokenRepository;
  StreamSubscription? _streamSubscription;

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  void _onEmailChanged(
    ForgotPasswordEmailChanged event,
    Emitter<ForgotPasswordState> emit,
  ) {
    emit(
      state.copyWith(
          response: BaseResponse.unknown(),
          email: event.email,
          isEmailValid: event.email.isValidEmail(),
          emailErrorText: (event.email.isValidEmail() || event.email.isEmpty)
              ? ''
              : 'Enter valid email'),
    );
  }

  void _onForgotPasswordSubmitted(
      ForgotPasswordSubmitted event, Emitter<ForgotPasswordState> emit) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var data =
          await _forgotPasswordRepository.forgotPassword(email: state.email);
      data.copyWith(message: 'Link for Password reset is sent to email.');

      emit(state.copyWith(response: data));
    } on BadRequestException {
      emit(state.copyWith(
          response: BaseResponse.error('Your account is not active yet.')));
    } on NotFoundException {
      emit(state.copyWith(
          response:
              BaseResponse.error('User does not exist with the given email.')));
    } catch (e) {
      state.copyWith(response: BaseResponse.error(e.toString()));
    }
  }

  void _onStartListenOnDeeplink(
    StartListenOnDeeplink event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    try {
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (uri != null &&
            uri.queryParameters['state'] == 'ok' &&
            uri.queryParameters['token'] != null) {
          add(DeepLinkValidateSuccess(uri));
        } else {
          add(const DeepLinkValidateFailed());
        }
      }, onError: (Object err) {
        add(const DeepLinkValidateFailed());
      });
    } catch (e) {
      add(const DeepLinkValidateFailed());
    }
  }

  void _onDeepLinkValidateSuccess(
    DeepLinkValidateSuccess event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    await Future.delayed(const Duration(milliseconds: 1500));
    _tokenRepository
        .saveResetPasswordToken(event.uri.queryParameters['token']!);
    emit(state.copyWith(
        response: const BaseResponse(),
        deeplinkStatus: DeeplinkStatus.success));
  }
}
