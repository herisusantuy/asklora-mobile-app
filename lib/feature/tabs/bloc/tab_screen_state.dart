part of 'tab_screen_bloc.dart';

enum TabPage { home, forYou, portfolio }

enum TabScreenBackState { none, openConfirmation, closeApp }

class TabScreenState extends Equatable {
  final TabPage currentTabPage;
  final bool aiPageSelected;
  final TabScreenBackState tabScreenBackState;

  const TabScreenState({
    required this.currentTabPage,
    this.aiPageSelected = false,
    this.tabScreenBackState = TabScreenBackState.none,
  });

  @override
  List<Object?> get props => [
        currentTabPage,
        aiPageSelected,
        tabScreenBackState,
      ];

  TabScreenState copyWith({
    TabPage? currentTabPage,
    bool? aiPageSelected,
    TabScreenBackState? tabScreenBackState,
    List<GlobalKey>? tutorialKeys,
  }) {
    return TabScreenState(
      currentTabPage: currentTabPage ?? this.currentTabPage,
      aiPageSelected: aiPageSelected ?? this.aiPageSelected,
      tabScreenBackState: tabScreenBackState ?? this.tabScreenBackState,
    );
  }
}
