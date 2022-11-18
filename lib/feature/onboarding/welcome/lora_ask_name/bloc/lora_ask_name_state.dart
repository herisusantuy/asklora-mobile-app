part of 'lora_ask_name_bloc.dart';

class LoraAskNameState extends Equatable {
  const LoraAskNameState({
    this.name = '',
  }) : super();

  final String name;

  LoraAskNameState copyWith({
    String? name,
  }) {
    return LoraAskNameState(
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [
        name,
      ];
}
