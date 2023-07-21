part of 'background_props_bloc.dart';

abstract class BackgroundPropsEvent {
  const BackgroundPropsEvent();
}

class BackgroundImageTypeChanged extends BackgroundPropsEvent {
  final BackgroundImageType backgroundImageType;

  const BackgroundImageTypeChanged(this.backgroundImageType);
}
