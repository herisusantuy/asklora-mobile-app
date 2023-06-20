part of 'custom_tab_bloc.dart';

enum TabPage { forYou, portfolio }

class CustomTabState extends Equatable {
  final TabPage currentTabPage;
  final bool aiPageSelected;

  const CustomTabState({
    required this.currentTabPage,
    this.aiPageSelected = false,
  });

  @override
  List<Object> get props => [
        currentTabPage,
        aiPageSelected,
      ];

  CustomTabState copyWith({
    TabPage? currentTabPage,
    bool? aiPageSelected,
  }) {
    return CustomTabState(
      currentTabPage: currentTabPage ?? this.currentTabPage,
      aiPageSelected: aiPageSelected ?? this.aiPageSelected,
    );
  }
}
