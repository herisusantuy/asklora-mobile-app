part of 'withdrawal_bloc.dart';

abstract class WithdrawalEvent extends Equatable {
  const WithdrawalEvent() : super();

  @override
  List<Object?> get props => [];
}

class WithdrawalSubmitted extends WithdrawalEvent {
  final String amount;

  const WithdrawalSubmitted(this.amount) : super();

  @override
  List<Object?> get props => [];
}
