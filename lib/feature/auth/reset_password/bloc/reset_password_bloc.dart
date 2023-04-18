import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/data/remote/base_api_client.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/extensions.dart';
import '../../repository/auth_repository.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const ResetPasswordState()) {
    on<ResetPasswordPasswordChanged>(_onPasswordChanged);
    on<ResetPasswordConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ResetPasswordSubmitted>(_onResetPasswordSubmitted);
  }

  final AuthRepository _authRepository;

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
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _authRepository.resetPassword(
          token: event.resetPasswordToken,
          password: state.password,
          confirmPassword: state.confirmPassword);

      emit(state.copyWith(
          response: BaseResponse.complete(data,
              message: 'Password changed successfully.')));
    } on BadRequestException {
      emit(state.copyWith(
          response:
              BaseResponse.error(message: 'Token is invalid or expired.')));
    } catch (e) {
      state.copyWith(response: BaseResponse.error());
    }
  }
}
