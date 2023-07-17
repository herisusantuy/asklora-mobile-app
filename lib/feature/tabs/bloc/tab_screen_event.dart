part of 'tab_screen_bloc.dart';

abstract class TabScreenEvent {
  const TabScreenEvent();
}

class TabChanged extends TabScreenEvent {
  final TabPage tabPage;

  const TabChanged(this.tabPage);
}

class OpenAiOverlay extends TabScreenEvent {
  const OpenAiOverlay();
}

class CloseAiOverLay extends TabScreenEvent {
  const CloseAiOverLay();
}

class BackButtonClicked extends TabScreenEvent {}
