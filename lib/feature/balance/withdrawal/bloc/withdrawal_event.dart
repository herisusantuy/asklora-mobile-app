part of 'withdrawal_bloc.dart';

abstract class WithdrawalEvent extends Equatable {
  const WithdrawalEvent() : super();

  @override
  List<Object?> get props => [];
}

class WithdrawalAmountChanged extends WithdrawalEvent {
  final double withdrawalAmount;

  const WithdrawalAmountChanged(this.withdrawalAmount) : super();

  @override
  List<Object?> get props => [withdrawalAmount];
}

class SubmitWithdrawal extends WithdrawalEvent {
  final double withdrawalAmount;

  const SubmitWithdrawal(this.withdrawalAmount);
}
