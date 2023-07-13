part of 'tutorial_bloc.dart';

class TutorialState extends Equatable {
  const TutorialState({
    this.isBotDetailsTutorial = false,
  });

  final bool isBotDetailsTutorial;

  @override
  List<Object?> get props {
    return [
      isBotDetailsTutorial,
    ];
  }

  TutorialState copyWith({
    bool? isBotDetailsTutorial,
  }) {
    return TutorialState(
      isBotDetailsTutorial: isBotDetailsTutorial ?? this.isBotDetailsTutorial,
    );
  }
}
