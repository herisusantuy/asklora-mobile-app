part of 'tab_theme_bloc.dart';

abstract class TabThemeEvent {
  const TabThemeEvent();
}

class BackgroundImageTypeChanged extends TabThemeEvent {
  final BackgroundImageType backgroundImageType;

  const BackgroundImageTypeChanged(this.backgroundImageType);
}
