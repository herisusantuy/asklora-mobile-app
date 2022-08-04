part of 'amount_bloc.dart';

abstract class AmountEvent extends Equatable {
  const AmountEvent() : super();

  @override
  List<Object?> get props => [];
}

class WithdrawalAmountChanged extends AmountEvent {
  final double value;

  const WithdrawalAmountChanged(this.value) : super();

  @override
  List<Object> get props => [value];
}
