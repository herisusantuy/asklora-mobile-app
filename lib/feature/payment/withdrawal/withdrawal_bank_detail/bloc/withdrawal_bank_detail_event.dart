part of 'withdrawal_bank_detail_bloc.dart';

abstract class WithdrawalBankDetailEvent extends Equatable {
  const WithdrawalBankDetailEvent() : super();

  @override
  List<Object?> get props => [];
}

class AccountNoChanged extends WithdrawalBankDetailEvent {
  final String value;

  const AccountNoChanged(this.value) : super();

  @override
  List<Object> get props => [value];
}

class AccountNameChanged extends WithdrawalBankDetailEvent {
  final String value;

  const AccountNameChanged(this.value) : super();

  @override
  List<Object> get props => [value];
}

class BankNameChanged extends WithdrawalBankDetailEvent {
  final String value;

  const BankNameChanged(this.value) : super();

  @override
  List<Object> get props => [value];
}

class BankNoChanged extends WithdrawalBankDetailEvent {
  final String value;

  const BankNoChanged(this.value) : super();

  @override
  List<Object> get props => [value];
}
