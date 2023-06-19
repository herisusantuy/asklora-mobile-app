part of 'custom_tab_bloc.dart';

abstract class CustomTabEvent {
  const CustomTabEvent();
}

class TabChanged extends CustomTabEvent {
  final TabPage tabPage;

  const TabChanged(this.tabPage);
}

class AiButtonSelected extends CustomTabEvent {
  const AiButtonSelected();
}
