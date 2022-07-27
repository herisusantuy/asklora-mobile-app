part of 'withdrawal_amount_bloc.dart';

abstract class WithdrawalAmountEvent extends Equatable {
  const WithdrawalAmountEvent() : super();

  @override
  List<Object?> get props => [];
}

class WithdrawalAmountChanged extends WithdrawalAmountEvent {
  final double value;

  const WithdrawalAmountChanged(this.value) : super();

  @override
  List<Object> get props => [value];
}
