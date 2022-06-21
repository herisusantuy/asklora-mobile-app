part of 'reset_password_bloc.dart';

enum ResetPasswordStatus { success, failure, unknown, loading }

class ResetPasswordState extends Equatable {
  const ResetPasswordState(
      {this.status = ResetPasswordStatus.unknown,
      this.email = '',
      this.isEmailValid = false,
      this.emailErrorText = '',
      this.responseMessage = ''})
      : super();

  final ResetPasswordStatus status;
  final String email;
  final bool isEmailValid;
  final String emailErrorText;
  final String responseMessage;

  ResetPasswordState copyWith({
    ResetPasswordStatus? status,
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
