part of 'user_response_bloc.dart';

enum PpiResponseState { initAddResponse, finishAddResponse, dispatchResponse }

class UserResponseState extends Equatable {
  final ResponseState responseState;
  final PpiResponseState ppiResponseState;
  final SnapShot? snapShot;

  /// Left => question id
  /// middle => Whole question object
  /// right => answer or score chosen by user
  /// for example (multiple choice) "quid03, {}, 3"
  /// for example (descriptive) "quid03, {}, my name"
  final List<Triplet<String, Question, String>>? userResponse;

  List<String> cachedSelectedChoices;
  List<String> cachedDefaultChoices;

  UserResponseState({
    this.responseState = ResponseState.unknown,
    this.ppiResponseState = PpiResponseState.finishAddResponse,
    this.userResponse,
    this.cachedSelectedChoices = const [],
    this.cachedDefaultChoices = const [],
    this.snapShot,
  });

  UserResponseState copyWith({
    ResponseState? responseState,
    PpiResponseState? ppiResponseState,
    List<Triplet<String, Question, String>>? userResponse,
    List<String>? cachedSelectedChoices,
    List<String>? cachedDefaultChoices,
    SnapShot? snapShot,
  }) {
    return UserResponseState(
      responseState: responseState ?? this.responseState,
      userResponse: userResponse ?? this.userResponse,
      ppiResponseState: ppiResponseState ?? this.ppiResponseState,
      cachedSelectedChoices:
          cachedSelectedChoices ?? this.cachedSelectedChoices,
      cachedDefaultChoices: cachedDefaultChoices ?? this.cachedDefaultChoices,
      snapShot: snapShot ?? this.snapShot,
    );
  }

  List<PpiSelectionRequest> getAllSelectionsInRequest(int id) =>
      userResponse
          ?.map((e) => PpiSelectionRequest(
              questionId: e.left, userId: id, answer: e.right))
          .toList() ??
      [];

  @override
  List<Object> get props => [
        responseState,
        DateTime.now().millisecondsSinceEpoch,
        cachedSelectedChoices,
        cachedDefaultChoices,
        ppiResponseState
      ];
}
