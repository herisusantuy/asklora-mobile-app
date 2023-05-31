part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  final BaseResponse response;
  final String password;
  final String newPassword;
  final String newPasswordErrorText;
  final String confirmNewPassword;
  final String confirmNewPasswordErrorText;

  const ChangePasswordState({
    this.response = const BaseResponse(),
    this.password = '',
    this.newPassword = '',
    this.newPasswordErrorText = '',
    this.confirmNewPassword = '',
    this.confirmNewPasswordErrorText = '',
  }) : super();

  ChangePasswordState copyWith({
    BaseResponse? response,
    String? password,
    String? newPassword,
    String? newPasswordErrorText,
    String? confirmNewPassword,
    String? confirmNewPasswordErrorText,
  }) {
    return ChangePasswordState(
      response: response ?? this.response,
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
      newPasswordErrorText: newPasswordErrorText ?? this.newPasswordErrorText,
      confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
      confirmNewPasswordErrorText:
          confirmNewPasswordErrorText ?? this.confirmNewPasswordErrorText,
    );
  }

  @override
  List<Object> get props => [
        response,
        password,
        newPassword,
        newPasswordErrorText,
        confirmNewPassword,
        confirmNewPasswordErrorText,
      ];

  bool disabledSaveButton() {
    if (password.isNotEmpty&&newPasswordErrorText.isEmpty &&
        confirmNewPasswordErrorText.isEmpty &&
        newPassword.isValidPassword() &&
        confirmNewPassword.isValidPassword() && newPassword==confirmNewPassword) {
      return false;
    } else {
      return true;
    }
  }
}
