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
