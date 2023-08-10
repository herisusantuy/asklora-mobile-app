import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';

import '../../../core/data/remote/base_api_client.dart';
import '../../../core/domain/base_response.dart';
import '../../../core/domain/otp/get_otp_request.dart';
import '../../../core/domain/token/repository/token_repository.dart';
import '../../../core/domain/validation_enum.dart';
import '../../../core/utils/storage/shared_preference.dart';
import '../../../core/utils/storage/storage_keys.dart';
import '../../onboarding/ppi/repository/ppi_response_repository.dart';
import '../sign_up/repository/sign_up_repository.dart';

part 'email_activation_event.dart';

part 'email_activation_state.dart';

class EmailActivationBloc
    extends Bloc<EmailActivationEvent, EmailActivationState> {
  EmailActivationBloc(
    this._signUpRepository,
    this._tokenRepository,
    this._sharedPreference,
    this._ppiResponseRepository,
  ) : super(const EmailActivationState()) {
    on<ResendEmailActivationLink>(_onResendEmailActivationLink);
    on<StartListenOnDeeplink>(_onStartListenOnDeeplink);
    on<DeepLinkValidateSuccess>(_onDeepLinkValidateSuccess);
  }

  final SignUpRepository _signUpRepository;
  final TokenRepository _tokenRepository;
  final PpiResponseRepository _ppiResponseRepository;
  final SharedPreference _sharedPreference;
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
              validationCode: ValidationCode.emailVerificationLinkSentSuccess,
              null)));
    } on AskloraApiClientException catch (e) {
      emit(state.copyWith(
          response: BaseResponse.error(validationCode: e.askloraError.type)));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error()));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }

  void _onStartListenOnDeeplink(
    StartListenOnDeeplink event,
    Emitter<EmailActivationState> emit,
  ) async {
    try {
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (uri != null &&
            uri.queryParameters['state'] == 'ok' &&
            uri.queryParameters['access'] != null &&
            uri.queryParameters['refresh'] != null) {
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
    Emitter<EmailActivationState> emit,
  ) async {
    emit(state.copyWith(response: BaseResponse.loading()));

    final tempId =
        await _sharedPreference.readIntData(StorageKeys.sfKeyPpiUserId);

    await _sharedPreference.writeBoolData(StorageKeys.sfAiWelcomeScreen, true);

    await _ppiResponseRepository.linkUser(tempId ?? 0);

    await Future.delayed(const Duration(milliseconds: 1500));

    await _tokenRepository
        .saveAccessToken(event.uri.queryParameters['access']!);
    await _tokenRepository
        .saveRefreshToken(event.uri.queryParameters['refresh']!);

    emit(state.copyWith(
        response: const BaseResponse(),
        deeplinkStatus: DeeplinkStatus.success));
  }
}
