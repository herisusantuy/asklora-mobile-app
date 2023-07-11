part of 'tab_screen_bloc.dart';

enum TabPage { home, forYou, portfolio }

enum SubTabPage {
  portfolioBotStockDetails('portfolioBotStockDetails');

  const SubTabPage(this.value);

  final String value;
}

extension TabPageExtension on TabPage {
  static ({String path, Map<String, dynamic> arguments}) data =
      (path: '', arguments: {});

  TabPage setData(
      {({
        String path,
        Map<String, dynamic> arguments
      }) arguments = (path: '', arguments: const {})}) {
    data = arguments;
    return this;
  }

  ({String path, Map<String, dynamic> arguments}) get getArguments => data;
}

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
  List<Object> get props =>
      [currentTabPage, aiPageSelected, tabScreenBackState];

  TabScreenState copyWith({
    TabPage? currentTabPage,
    bool? aiPageSelected,
    TabScreenBackState? tabScreenBackState,
  }) {
    return TabScreenState(
      currentTabPage: currentTabPage ?? this.currentTabPage,
      aiPageSelected: aiPageSelected ?? this.aiPageSelected,
      tabScreenBackState: tabScreenBackState ?? this.tabScreenBackState,
    );
  }
}
