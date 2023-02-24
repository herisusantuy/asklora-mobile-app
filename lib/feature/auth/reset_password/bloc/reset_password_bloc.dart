import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/remote/asklora_api_client.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/token/repository/token_repository.dart';
import '../../../../core/utils/extensions.dart';
import '../repository/reset_password_repository.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc(
      {required ResetPasswordRepository resetPasswordRepository,
      required TokenRepository tokenRepository})
      : _resetPasswordRepository = resetPasswordRepository,
        _tokenRepository = tokenRepository,
        super(const ResetPasswordState()) {
    on<ResetPasswordPasswordChanged>(_onPasswordChanged);
    on<ResetPasswordConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ResetPasswordSubmitted>(_onResetPasswordSubmitted);
  }

  final ResetPasswordRepository _resetPasswordRepository;
  final TokenRepository _tokenRepository;

  void _onPasswordChanged(
    ResetPasswordPasswordChanged event,
    Emitter<ResetPasswordState> emit,
  ) {
    emit(
      state.copyWith(
          password: event.password,
          passwordErrorText: ((event.password.isValidPassword() &&
                      event.password == state.confirmPassword) ||
                  event.password.isEmpty)
              ? ''
              : (event.password.isValidPassword() &&
                      state.confirmPassword != event.password)
                  ? 'Your password does not match.'
                  : 'Enter valid password',
          confirmPasswordErrorText: event.password == state.confirmPassword
              ? ''
              : state.confirmPasswordErrorText),
    );
  }

  void _onConfirmPasswordChanged(
    ResetPasswordConfirmPasswordChanged event,
    Emitter<ResetPasswordState> emit,
  ) {
    emit(
      state.copyWith(
          confirmPassword: event.confirmPassword,
          confirmPasswordErrorText: ((event.confirmPassword.isValidPassword() &&
                      state.password == event.confirmPassword) ||
                  event.confirmPassword.isEmpty)
              ? ''
              : (event.confirmPassword.isValidPassword() &&
                      event.confirmPassword != state.password)
                  ? 'Your password does not match.'
                  : 'Enter valid password',
          passwordErrorText: state.password == event.confirmPassword
              ? ''
              : state.passwordErrorText),
    );
  }

  void _onResetPasswordSubmitted(
      ResetPasswordSubmitted event, Emitter<ResetPasswordState> emit) async {
    try {
      var resetPasswordToken = await _tokenRepository.getResetPasswordToken();
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _resetPasswordRepository.resetPassword(
          token: resetPasswordToken!,
          password: state.password,
          confirmPassword: state.confirmPassword);

      emit(state.copyWith(
          response: BaseResponse.complete(data,
              message: 'Password changed successfully.')));
    } on BadRequestException {
      emit(state.copyWith(
          response: BaseResponse.error('Token is invalid or expired.')));
    } catch (e) {
      state.copyWith(response: BaseResponse.error(e.toString()));
    }
  }
}
