part of 'user_response_bloc.dart';

class UserResponseState extends Equatable {
  final ResponseState responseState;

  /// Left => question id
  /// middle => Whole question object
  /// right => answer or score chosen by user
  /// for example (multiple choice) "quid03, {}, 3"
  /// for example (desciptive) "quid03, {}, my name"
  final List<Triplet<String, Question, String>>? userResponse;

  const UserResponseState({
    this.responseState = ResponseState.unknown,
    this.userResponse,
  });

  UserResponseState copyWith({
    ResponseState? responseState,
    List<Triplet<String, Question, String>>? userResponse,
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
