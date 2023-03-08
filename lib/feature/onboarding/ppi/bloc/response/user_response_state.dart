part of 'user_response_bloc.dart';

enum PpiResponseState {
  initAddResponse,
  calculate,
  finishAddResponse,
  dispatchResponse
}

class UserResponseState extends Equatable {
  final ResponseState responseState;
  final PpiResponseState ppiResponseState;
  final BaseResponse<SnapShot>? snapShot;
  final String message;

  /// Left => question id
  /// middle => Whole question object
  /// right => answer or score chosen by user
  /// for example (multiple choice) "quid03, {}, 3"
  /// for example (descriptive) "quid03, {}, my name"
  final List<Triplet<String, Question, String>>? userResponse;

  final List<String> cachedSelectedChoices;
  final List<String> cachedDefaultChoices;

  const UserResponseState({
    this.responseState = ResponseState.unknown,
    this.ppiResponseState = PpiResponseState.finishAddResponse,
    this.userResponse,
    this.cachedSelectedChoices = const [],
    this.cachedDefaultChoices = const [],
    this.snapShot,
    this.message = '',
  });

  UserResponseState copyWith({
    ResponseState? responseState,
    PpiResponseState? ppiResponseState,
    List<Triplet<String, Question, String>>? userResponse,
    List<String>? cachedSelectedChoices,
    List<String>? cachedDefaultChoices,
    BaseResponse<SnapShot>? snapShot,
    String? message,
  }) {
    return UserResponseState(
      responseState: responseState ?? this.responseState,
      userResponse: userResponse ?? this.userResponse,
      ppiResponseState: ppiResponseState ?? this.ppiResponseState,
      cachedSelectedChoices:
          cachedSelectedChoices ?? this.cachedSelectedChoices,
      cachedDefaultChoices: cachedDefaultChoices ?? this.cachedDefaultChoices,
      snapShot: snapShot ?? this.snapShot,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [
        responseState,
        cachedSelectedChoices,
        cachedDefaultChoices,
        ppiResponseState,
        message,
      ];
}
