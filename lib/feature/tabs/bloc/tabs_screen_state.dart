part of 'tabs_screen_bloc.dart';

class TabScreenState extends Equatable {
  final int currentIndexScreen;

  const TabScreenState({
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
