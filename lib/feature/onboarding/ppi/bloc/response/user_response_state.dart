part of 'user_response_bloc.dart';

class UserResponseState extends Equatable {
  final ResponseState responseState;
  final PpiUserResponse ppiUserResponse;

  final List<Triplet<String, Question, int>>? test;

  const UserResponseState({
    this.responseState = ResponseState.unknown,
    this.ppiUserResponse = const PpiUserResponse(),
    this.test,
  });

  UserResponseState copyWith({
    ResponseState? responseState,
    PpiUserResponse? ppiUserResponse,
    List<Triplet<String, Question, int>>? test,
  }) {
    return UserResponseState(
      responseState: responseState ?? this.responseState,
      ppiUserResponse: ppiUserResponse ?? this.ppiUserResponse,
      test: test ?? this.test,
    );
  }

  @override
  List<Object> get props => [responseState, ppiUserResponse];
}
