part of 'backdoor_screen_bloc.dart';

@immutable
abstract class BackdoorScreenEvent {}

class OnBaseUrlChanged extends BackdoorScreenEvent {
  final String baseUrl;

  OnBaseUrlChanged(this.baseUrl);
}
