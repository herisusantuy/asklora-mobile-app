part of 'tutorial_bloc.dart';

class TutorialState extends Equatable {
  final bool isBotDetailsTutorial;
  const TutorialState({
    this.isBotDetailsTutorial = false,
  });

  TutorialState copyWith({
    bool? isBotDetailsTutorial,
  }) {
    return TutorialState(
      isBotDetailsTutorial: isBotDetailsTutorial ?? this.isBotDetailsTutorial,
    );
  }

  @override
  List<Object> get props => [isBotDetailsTutorial];
}
