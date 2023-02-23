part of 'forgot_password_bloc.dart';

enum DeeplinkStatus { inProgress, success, failed }

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.response = const BaseResponse(),
    this.deeplinkStatus = DeeplinkStatus.inProgress,
    this.email = '',
    this.isEmailValid = false,
    this.emailErrorText = '',
  }) : super();

  final BaseResponse response;
  final DeeplinkStatus deeplinkStatus;
  final String email;
  final bool isEmailValid;
  final String emailErrorText;

  ForgotPasswordState copyWith({
    BaseResponse? response,
    DeeplinkStatus? deeplinkStatus,
    String? email,
    bool? isEmailValid,
    String? emailErrorText,
  }) {
    return ForgotPasswordState(
      response: response ?? this.response,
      deeplinkStatus: deeplinkStatus ?? this.deeplinkStatus,
      email: email ?? this.email,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      emailErrorText: emailErrorText ?? this.emailErrorText,
    );
  }

  @override
  List<Object> get props {
    return [
      response,
      deeplinkStatus,
      email,
      isEmailValid,
      emailErrorText,
    ];
  }
}
