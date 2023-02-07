part of 'user_response_bloc.dart';

class UserResponseState extends Equatable {
  final ResponseState responseState;

  final List<Triplet<String, Question, int>>? userResponse;

  const UserResponseState({
    this.responseState = ResponseState.unknown,
    this.userResponse,
  });

  UserResponseState copyWith({
    ResponseState? responseState,
    List<Triplet<String, Question, int>>? userResponse,
  }) {
    return UserResponseState(
      responseState: responseState ?? this.responseState,
      userResponse: userResponse ?? this.userResponse,
    );
  }

  @override
  List<Object> get props =>
      [responseState, DateTime.now().millisecondsSinceEpoch];
}
