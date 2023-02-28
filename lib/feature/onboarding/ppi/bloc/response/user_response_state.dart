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

  Future<bool> isNotEligible() async {
    final scores = await _calculate();
    return scores.left < 3 || scores.right < 3;
  }

  /// Assuming the last index (4) is for age. In case anything changes happen
  /// in the PPI questioner we need to update this logic.
  /// References:
  ///   A5 -> Age,
  ///   3rd index of list is "Risk Level" question.
  ///   4th index of list is age question.
  ///   Calculation Reference: https://loratechai.atlassian.net/wiki/spaces/SPD/pages/1144619026/PPI+Calculation
  /// Returns a Pair<Suitability Score, Objective Score> of Suitability Score and Objective Score
  Future<Pair<num, num>> _calculate() {
    final int age = int.parse(userResponse![4].right);

    if (userResponse != null) {
      final List<num> scores = List.empty(growable: true);

      for (var e in userResponse!) {
        String? a = e.middle.choices
                ?.firstWhereOrNull(
                    (element) => element.id.toString() == e.right)
                ?.score ??
            '0';
        scores.add(num.parse(a));
      }

      var ageScore = (6 - pow(age / 35, 2));

      ageScore = ageScore <= 1
          ? 1
          : ageScore >= 5.5
              ? 5.5
              : ageScore;

      scores.removeWhere((element) => element == 0);
      scores.add(ageScore);

      final mean = scores.reduce((a, b) => a + b) / scores.length;

      final maxOfScores = scores.reduce(max);

      var suitabilityScore = mean + maxOfScores / 2;

      final objectiveScore = scores[3] + 0.5;

      suitabilityScore = min(suitabilityScore, objectiveScore);

      return Future.value(Pair(suitabilityScore, objectiveScore));
    } else {
      return Future.value(Pair(0, 0));
    }
  }

  @override
  List<Object> get props => [
        responseState,
        cachedSelectedChoices,
        cachedDefaultChoices,
        ppiResponseState
      ];
}

class ScoreCalculation extends UserResponseState {
  final bool isUserIsNotEligible;

  ScoreCalculation({required this.isUserIsNotEligible});
}
