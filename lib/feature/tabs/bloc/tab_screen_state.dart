part of 'tab_screen_bloc.dart';

enum TabPage { home, forYou, portfolio }

enum TabScreenBackState { none, openConfirmation, closeApp }

class TabScreenState extends Equatable {
  final TabPage currentTabPage;
  final bool aiPageSelected;
  final TabScreenBackState tabScreenBackState;
  final bool isTutorial;
  final List<GlobalKey> tutorialKeys;

  const TabScreenState({
    required this.currentTabPage,
    this.aiPageSelected = false,
    this.tabScreenBackState = TabScreenBackState.none,
    this.isTutorial = false,
    required this.tutorialKeys,
  });

  @override
  List<Object?> get props => [
        currentTabPage,
        aiPageSelected,
        tabScreenBackState,
        isTutorial,
        tutorialKeys,
      ];

  TabScreenState copyWith({
    TabPage? currentTabPage,
    bool? aiPageSelected,
    TabScreenBackState? tabScreenBackState,
    bool? isTutorial,
    List<GlobalKey>? tutorialKeys,
  }) {
    return TabScreenState(
      currentTabPage: currentTabPage ?? this.currentTabPage,
      aiPageSelected: aiPageSelected ?? this.aiPageSelected,
      tabScreenBackState: tabScreenBackState ?? this.tabScreenBackState,
      isTutorial: isTutorial ?? this.isTutorial,
      tutorialKeys: tutorialKeys ?? this.tutorialKeys,
    );
  }
}
