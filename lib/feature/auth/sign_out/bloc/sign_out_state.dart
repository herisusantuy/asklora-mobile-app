part of 'sign_out_bloc.dart';

class SignOutState extends Equatable {
  final ResponseState status;
  final String responseMessage;

  const SignOutState({
    this.status = ResponseState.unknown,
    this.responseMessage = '',
  }) : super();

  @override
  List<Object> get props => [
        status,
        responseMessage,
      ];

  SignOutState copyWith({
    ResponseState? status,
    String? responseMessage,
  }) {
    return SignOutState(
      status: status ?? this.status,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }
}
