part of 'tabs_screen_bloc.dart';

class TabScreenState {
  final int currentIndexScreen;

  TabScreenState({
    required this.currentIndexScreen,
  });

  @override
  List<Object> get props => [currentIndexScreen];

  TabScreenState copyWith({
    int? currentIndexScreen,
  }) {
    return TabScreenState(
      currentIndexScreen: currentIndexScreen ?? this.currentIndexScreen,
    );
  }
}
