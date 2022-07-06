part of 'sign_out_bloc.dart';

enum SignOutStatus { success, failure, unknown, loading }

class SignOutState extends Equatable {
  final SignOutStatus status;
  final String responseMessage;

  const SignOutState({
    this.status = SignOutStatus.unknown,
    this.responseMessage = '',
  }) : super();

  @override
  List<Object> get props => [
        status,
        responseMessage,
      ];

  SignOutState copyWith({
    SignOutStatus? status,
    String? responseMessage,
  }) {
    return SignOutState(
      status: status ?? this.status,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }
}
