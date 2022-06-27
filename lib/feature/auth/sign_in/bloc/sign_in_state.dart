part of 'sign_in_bloc.dart';

enum SignInStatus { success, failure, unknown, loading }

class SignInState extends Equatable {
  final SignInStatus status;
  final String emailAddress;
  final bool isEmailValid;
  final String emailAddressErrorText;
  final String password;
  final String passwordErrorText;
  final bool isPasswordValid;
  final String responseMessage;

  const SignInState({
    this.status = SignInStatus.unknown,
    this.emailAddress = '',
    this.isEmailValid = false,
    this.emailAddressErrorText = '',
    this.password = '',
    this.isPasswordValid = false,
    this.passwordErrorText = '',
    this.responseMessage = '',
  }) : super();

  @override
  List<Object> get props => [
        status,
        emailAddress,
        isEmailValid,
        emailAddressErrorText,
        password,
        isPasswordValid,
        passwordErrorText,
        responseMessage,
      ];

  SignInState copyWith({
    SignInStatus? status,
    String? emailAddress,
    bool? isEmailValid,
    String? emailAddressErrorText,
    String? password,
    String? passwordErrorText,
    bool? isPasswordValid,
    String? responseMessage,
  }) {
    return SignInState(
      status: status ?? this.status,
      emailAddress: emailAddress ?? this.emailAddress,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      emailAddressErrorText:
          emailAddressErrorText ?? this.emailAddressErrorText,
      password: password ?? this.password,
      passwordErrorText: passwordErrorText ?? this.passwordErrorText,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }
}
