// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tabs_screen_bloc.dart';

class TabScreenState extends Equatable {
  final int currentIndexScreen;
  final bool isShowConfirmationBack;
  final bool isConfirmedToBack;

  const TabScreenState({
    required this.currentIndexScreen,
    this.isShowConfirmationBack = false,
    this.isConfirmedToBack = false,
  });

  @override
  List<Object> get props => [
        currentIndexScreen,
        isShowConfirmationBack,
        isConfirmedToBack,
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
      isConfirmedToBack: isConfirmedToBack ?? this.isConfirmedToBack,
    );
  }
}
