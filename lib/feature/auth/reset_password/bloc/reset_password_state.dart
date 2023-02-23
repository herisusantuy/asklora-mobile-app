part of 'reset_password_bloc.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState(
      {this.response = const BaseResponse(),
      this.password = '',
      this.confirmPassword = '',
      this.isPasswordValid = false,
      this.isConfirmPasswordValid = false,
      this.passwordErrorText = '',
      this.confirmPasswordErrorText = ''})
      : super();

  final BaseResponse response;
  final String password;
  final String confirmPassword;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final String passwordErrorText;
  final String confirmPasswordErrorText;

  ResetPasswordState copyWith({
    BaseResponse? response,
    String? password,
    String? confirmPassword,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    String? passwordErrorText,
    String? confirmPasswordErrorText,
  }) {
    return ResetPasswordState(
      response: response ?? this.response,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid:
          isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      passwordErrorText: passwordErrorText ?? this.passwordErrorText,
      confirmPasswordErrorText:
          confirmPasswordErrorText ?? this.confirmPasswordErrorText,
    );
  }

  @override
  List<Object> get props {
    return [
      response,
      password,
      confirmPassword,
      isPasswordValid,
      isConfirmPasswordValid,
      passwordErrorText,
      confirmPasswordErrorText,
    ];
  }
}
