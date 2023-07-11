part of 'tab_screen_bloc.dart';

abstract class TabScreenEvent {
  const TabScreenEvent();
}

class TabChanged extends TabScreenEvent {
  final TabPage tabPage;

  const TabChanged(this.tabPage);
}

class AiButtonSelected extends TabScreenEvent {
  const AiButtonSelected();
}

class BackButtonClicked extends TabScreenEvent {}
