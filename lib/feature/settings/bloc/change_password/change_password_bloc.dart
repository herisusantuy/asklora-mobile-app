import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/extensions.dart';
import '../../repository/change_password_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordRepository _changePasswordRepository;

  ChangePasswordBloc(
      {required ChangePasswordRepository changePasswordRepository})
      : _changePasswordRepository = changePasswordRepository,
        super(const ChangePasswordState()) {
    on<PasswordChanged>(_onPasswordChanged);
    on<NewPasswordChanged>(_onNewPasswordChanged);
    on<ConfirmNewPasswordChanged>(_onConfirmNewPasswordChanged);
  }

  _onPasswordChanged(PasswordChanged event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(password: event.password));
  }

  _onNewPasswordChanged(
      NewPasswordChanged event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(
      newPassword: event.newPassword,
      // newPasswordErrorText: (event.newPassword.isValidPassword() && event.newPassword == state.confirmNewPassword) || event.newPassword.isEmpty ? '' :
    ));
  }

  _onConfirmNewPasswordChanged(
      ConfirmNewPasswordChanged event, Emitter<ChangePasswordState> emit) {
    emit(state.copyWith(
      confirmNewPassword: event.confirmNewPassword,
      confirmNewPasswordErrorText: event.confirmNewPassword == state.newPassword
          ? ''
          : 'Your Password does not match.',
    ));
  }
}
