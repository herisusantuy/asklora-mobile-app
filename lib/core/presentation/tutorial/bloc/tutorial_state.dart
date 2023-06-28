part of 'tutorial_bloc.dart';

class TutorialState extends Equatable {
  final bool isBotDetailsTutorial;
  final bool isTradeSummaryTutorial;
  const TutorialState({
    this.isBotDetailsTutorial = false,
    this.isTradeSummaryTutorial = false,
  });

  TutorialState copyWith({
    bool? isBotDetailsTutorial,
    bool? isTradeSummaryTutorial,
  }) {
    return TutorialState(
      isBotDetailsTutorial: isBotDetailsTutorial ?? this.isBotDetailsTutorial,
      isTradeSummaryTutorial:
          isTradeSummaryTutorial ?? this.isTradeSummaryTutorial,
    );
  }

  @override
  List<Object> get props => [
        isBotDetailsTutorial,
        isTradeSummaryTutorial,
      ];
}
