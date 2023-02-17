part of 'user_response_bloc.dart';

enum PpiResponseState { initAddResponse, finishAddResponse, dispatchResponse }

class UserResponseState extends Equatable {
  final ResponseState responseState;
  final PpiResponseState ppiResponseState;

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
  });

  UserResponseState copyWith({
    ResponseState? responseState,
    PpiResponseState? ppiResponseState,
    List<Triplet<String, Question, String>>? userResponse,
    List<String>? cachedSelectedChoices,
    List<String>? cachedDefaultChoices,
  }) {
    return UserResponseState(
      responseState: responseState ?? this.responseState,
      userResponse: userResponse ?? this.userResponse,
      ppiResponseState: ppiResponseState ?? this.ppiResponseState,
      cachedSelectedChoices:
          cachedSelectedChoices ?? this.cachedSelectedChoices,
      cachedDefaultChoices: cachedDefaultChoices ?? this.cachedDefaultChoices,
    );
  }

  List<PpiSelectionRequest> getAllSelectionsInRequest() =>
      userResponse
          ?.map((e) => PpiSelectionRequest(
              questionId: e.left, userId: 2, answer:
      e.right))
          .toList() ??
      [];

  @override
  List<Object> get props => [
        responseState,
        DateTime.now().millisecondsSinceEpoch,
        cachedSelectedChoices ?? [],
        cachedDefaultChoices ?? [],
        ppiResponseState
      ];
}
