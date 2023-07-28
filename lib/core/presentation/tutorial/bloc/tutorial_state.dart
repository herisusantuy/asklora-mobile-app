part of 'tutorial_bloc.dart';

class TutorialState extends Equatable {
  const TutorialState({
    this.isBotDetailsTutorial = false,
    this.isBotRecommendationTutorial = false,
  });

  final bool isBotDetailsTutorial;
  final bool isBotRecommendationTutorial;

  @override
  List<Object?> get props {
    return [
      isBotDetailsTutorial,
      isBotRecommendationTutorial,
    ];
  }

  TutorialState copyWith({
    bool? isBotDetailsTutorial,
    bool? isBotRecommendationTutorial,
  }) {
    return TutorialState(
      isBotDetailsTutorial: isBotDetailsTutorial ?? this.isBotDetailsTutorial,
      isBotRecommendationTutorial:
          isBotRecommendationTutorial ?? this.isBotRecommendationTutorial,
    );
  }
}
