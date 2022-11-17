part of 'user_response_bloc.dart';

class UserResponseState extends Equatable {
  final ResponseState responseState;
  final PpiUserResponse ppiUserResponse;

  const UserResponseState({
    this.responseState = ResponseState.unknown,
    this.ppiUserResponse = const PpiUserResponse(),
  });

  UserResponseState copyWith({
    ResponseState? responseState,
    PpiUserResponse? ppiUserResponse,
  }) {
    return UserResponseState(
      responseState: responseState ?? this.responseState,
      ppiUserResponse: ppiUserResponse ?? this.ppiUserResponse,
    );
  }

  @override
  List<Object> get props => [responseState, ppiUserResponse];
}
