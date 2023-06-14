part of 'tabs_screen_bloc.dart';

abstract class TabScreenEvent extends Equatable {
  const TabScreenEvent();
  @override
  List<Object> get props => [];
}

class TabIndexChanged extends TabScreenEvent {
  final int index;

  const TabIndexChanged(this.index);
  @override
  List<Object> get props => [index];
}

class BackButtonClickedOnce extends TabScreenEvent {}

class BackButtonClickedTwice extends TabScreenEvent {}
