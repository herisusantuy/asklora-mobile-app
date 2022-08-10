part of 'amount_bloc.dart';

abstract class AmountEvent extends Equatable {
  const AmountEvent() : super();

  @override
  List<Object?> get props => [];
}

class AmountChanged extends AmountEvent {
  final double value;

  const AmountChanged(this.value) : super();

  @override
  List<Object> get props => [value];
}

class AmountSubmitted extends AmountEvent {
  const AmountSubmitted() : super();

  @override
  List<Object> get props => [];
}
