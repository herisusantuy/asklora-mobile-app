part of 'sign_up_bloc.dart';

enum SignUpStatus { success, failure, unknown, loading }

class SignUpState extends Equatable {
  const SignUpState(
      {this.status = SignUpStatus.unknown,
      this.username = '',
      this.password = '',
      this.isEmailValid = false,
      this.usernameErrorText = '',
      this.passwordErrorText = '',
      this.responseMessage = '',
      this.isPasswordValid = false})
      : super();

  final SignUpStatus status;
  final String username;
  final String password;
  final String usernameErrorText;
  final bool isPasswordValid;
  final String passwordErrorText;
  final bool isEmailValid;
  final String responseMessage;

  SignUpState copyWith({
    SignUpStatus? status,
    String? username,
    String? password,
    String? usernameErrorText,
    String? passwordErrorText,
    bool? isEmailValid,
    String? responseMessage,
    bool? isPasswordValid,
  }) {
    return SignUpState(
        status: status ?? this.status,
        username: username ?? this.username,
        password: password ?? this.password,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        usernameErrorText: usernameErrorText ?? this.usernameErrorText,
        responseMessage: responseMessage ?? this.responseMessage);
  }

  @override
  List<Object> get props => [
        status,
        username,
        password,
        isEmailValid,
        isPasswordValid,
        usernameErrorText,
        responseMessage,
      ];
}
