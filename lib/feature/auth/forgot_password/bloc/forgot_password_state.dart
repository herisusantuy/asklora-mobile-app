part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.response = const BaseResponse(),
    this.email = '',
    this.isEmailValid = false,
    this.emailErrorText = '',
  }) : super();

  final BaseResponse response;
  final String email;
  final bool isEmailValid;
  final String emailErrorText;

  ForgotPasswordState copyWith({
    BaseResponse? response,
    String? email,
    bool? isEmailValid,
    String? emailErrorText,
  }) {
    return ForgotPasswordState(
      response: response ?? this.response,
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      emailErrorText: emailErrorText ?? this.emailErrorText,
    );
  }

  @override
  List<Object> get props {
    return [
      response,
      email,
      isEmailValid,
      emailErrorText,
    ];
  }
}
