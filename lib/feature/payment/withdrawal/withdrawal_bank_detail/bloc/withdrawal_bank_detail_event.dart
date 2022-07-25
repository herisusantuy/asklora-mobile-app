part of 'withdrawal_bank_detail_bloc.dart';

abstract class WithdrawalBankDetailEvent extends Equatable {
  const WithdrawalBankDetailEvent() : super();

  @override
  List<Object?> get props => [];
}

class AccountNumberChanged extends WithdrawalBankDetailEvent {
  final String value;

  const AccountNumberChanged(this.value) : super();

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

class BankNumberChanged extends WithdrawalBankDetailEvent {
  final String value;

  const BankNumberChanged(this.value) : super();

  @override
  List<Object> get props => [value];
}
