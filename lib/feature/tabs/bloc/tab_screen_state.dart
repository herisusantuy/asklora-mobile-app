part of 'tab_screen_bloc.dart';

enum SubTabPage {
  portfolioBotStockDetails('portfolioBotStockDetails'),
  recommendationsBotStockDetails('recommendationsBotStockDetails');

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
  final BackgroundImageType backgroundImageType;

  const TabScreenState(
      {required this.currentTabPage,
      this.aiPageSelected = false,
      this.tabScreenBackState = TabScreenBackState.none,
      this.backgroundImageType = BackgroundImageType.none});

  @override
  List<Object?> get props => [
        currentTabPage,
        aiPageSelected,
        tabScreenBackState,
        backgroundImageType,
      ];

  TabScreenState copyWith({
    TabPage? currentTabPage,
    bool? aiPageSelected,
    TabScreenBackState? tabScreenBackState,
    List<GlobalKey>? tutorialKeys,
    BackgroundImageType? backgroundImageType,
  }) {
    return TabScreenState(
      currentTabPage: currentTabPage ?? this.currentTabPage,
      aiPageSelected: aiPageSelected ?? this.aiPageSelected,
      tabScreenBackState: tabScreenBackState ?? this.tabScreenBackState,
      backgroundImageType: backgroundImageType ?? this.backgroundImageType,
    );
  }
}
