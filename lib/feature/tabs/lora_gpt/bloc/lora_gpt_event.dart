part of 'lora_gpt_bloc.dart';

abstract class LoraGptEvent extends Equatable {
  const LoraGptEvent();
}

class OnEditQuery extends LoraGptEvent {
  final String query;

  const OnEditQuery(this.query);

  @override
  List<Object?> get props => [query];
}

class OnSearchQuery extends LoraGptEvent {
  const OnSearchQuery();

  @override
  List<Object?> get props => [];
}

class OnScreenLaunch extends LoraGptEvent {
  const OnScreenLaunch();

  @override
  List<Object?> get props => [];
}

class OnResetSession extends LoraGptEvent {
  const OnResetSession();

  @override
  List<Object?> get props => [];
}

class OnFinishTyping extends LoraGptEvent {
  const OnFinishTyping();

  @override
  List<Object?> get props => [];
}

class ShowOverLayScreen extends LoraGptEvent {
  final bool shouldShowOverlayScreen;

  const ShowOverLayScreen({this.shouldShowOverlayScreen = true});

  @override
  List<Object?> get props => [];
}
