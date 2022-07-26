part of 'reset_password_bloc.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    this.response = const BaseResponse(),
    this.email = '',
    this.isEmailValid = false,
    this.emailErrorText = '',
  }) : super();

  final BaseResponse response;
  final String email;
  final bool isEmailValid;
  final String emailErrorText;

  ResetPasswordState copyWith({
    BaseResponse? response,
    String? email,
    bool? isEmailValid,
    String? emailErrorText,
  }) {
    return ResetPasswordState(
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
