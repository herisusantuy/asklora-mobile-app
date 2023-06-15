part of 'tabs_screen_bloc.dart';

class TabScreenState extends Equatable {
  final int currentIndexScreen;
  final bool shouldShowExitConfirmation;

  const TabScreenState({
    required this.currentIndexScreen,
    this.shouldShowExitConfirmation = false,
  });

  @override
  List<Object> get props => [
        currentIndexScreen,
        shouldShowExitConfirmation,
      ];

  TabScreenState copyWith({
    int? currentIndexScreen,
    bool? shouldShowExitConfirmation,
    bool? isConfirmedToBack,
  }) {
    return TabScreenState(
      currentIndexScreen: currentIndexScreen ?? this.currentIndexScreen,
      shouldShowExitConfirmation:
          shouldShowExitConfirmation ?? this.shouldShowExitConfirmation,
    );
  }
}
