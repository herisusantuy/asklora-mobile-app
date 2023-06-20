part of 'tab_screen_bloc.dart';

enum TabPage { home, forYou, portfolio }

class TabScreenState extends Equatable {
  final TabPage currentTabPage;
  final bool aiPageSelected;

  const TabScreenState({
    required this.currentTabPage,
    this.aiPageSelected = false,
  });

  @override
  List<Object> get props => [
        currentTabPage,
        aiPageSelected,
      ];

  TabScreenState copyWith({
    TabPage? currentTabPage,
    bool? aiPageSelected,
  }) {
    return TabScreenState(
      currentTabPage: currentTabPage ?? this.currentTabPage,
      aiPageSelected: aiPageSelected ?? this.aiPageSelected,
    );
  }
}
