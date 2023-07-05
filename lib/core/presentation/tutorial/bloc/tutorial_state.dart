part of 'tutorial_bloc.dart';

class TutorialState extends Equatable {
  final bool isTradeSummaryTutorial;
  const TutorialState({
    this.isTradeSummaryTutorial = false,
  });

  TutorialState copyWith({
    bool? isTradeSummaryTutorial,
  }) {
    return TutorialState(
      isTradeSummaryTutorial:
          isTradeSummaryTutorial ?? this.isTradeSummaryTutorial,
    );
  }

  @override
  List<Object> get props => [
        isTradeSummaryTutorial,
      ];
}
