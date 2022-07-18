part of 'reset_password_bloc.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState(
      {this.status = ResponseState.unknown,
      this.email = '',
      this.isEmailValid = false,
      this.emailErrorText = '',
      this.responseMessage = ''})
      : super();

  final ResponseState status;
  final String email;
  final bool isEmailValid;
  final String emailErrorText;
  final String responseMessage;

  ResetPasswordState copyWith({
    ResponseState? status,
    String? email,
    bool? isEmailValid,
    String? emailErrorText,
    String? responseMessage,
  }) {
    return ResetPasswordState(
      status: status ?? this.status,
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      emailErrorText: emailErrorText ?? this.emailErrorText,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }

  @override
  List<Object> get props {
    return [
      status,
      email,
      isEmailValid,
      emailErrorText,
      responseMessage,
    ];
  }
}
