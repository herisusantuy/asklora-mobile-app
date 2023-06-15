part of 'tabs_screen_bloc.dart';

class TabScreenState extends Equatable {
  final int currentIndexScreen;
  final bool isShowConfirmationBack;

  const TabScreenState({
    required this.currentIndexScreen,
    this.isShowConfirmationBack = false,
  });

  @override
  List<Object> get props => [
        currentIndexScreen,
        isShowConfirmationBack,
      ];

  TabScreenState copyWith({
    int? currentIndexScreen,
    bool? isShowConfirmationBack,
    bool? isConfirmedToBack,
  }) {
    return TabScreenState(
      currentIndexScreen: currentIndexScreen ?? this.currentIndexScreen,
      isShowConfirmationBack:
          isShowConfirmationBack ?? this.isShowConfirmationBack,
    );
  }
}
