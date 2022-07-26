part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState(
      {this.response = const BaseResponse(),
      this.username = '',
      this.password = '',
      this.isEmailValid = false,
      this.usernameErrorText = '',
      this.passwordErrorText = '',
      this.isPasswordValid = false})
      : super();

  final BaseResponse response;
  final String username;
  final String password;
  final String usernameErrorText;
  final bool isPasswordValid;
  final String passwordErrorText;
  final bool isEmailValid;

  SignUpState copyWith({
    BaseResponse? response,
    String? username,
    String? password,
    String? usernameErrorText,
    String? passwordErrorText,
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return SignUpState(
      response: response ?? this.response,
      username: username ?? this.username,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      usernameErrorText: usernameErrorText ?? this.usernameErrorText,
      passwordErrorText: passwordErrorText ?? this.passwordErrorText,
    );
  }

  @override
  List<Object> get props => [
        response,
        username,
        password,
        isEmailValid,
        isPasswordValid,
        usernameErrorText,
        passwordErrorText,
      ];
}
