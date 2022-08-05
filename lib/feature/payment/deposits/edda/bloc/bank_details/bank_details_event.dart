part of 'bank_details_bloc.dart';

abstract class BankDetailsEvent extends Equatable {
  const BankDetailsEvent() : super();

  @override
  List<Object?> get props => [];
}

class BankAccountNumberChanged extends BankDetailsEvent {
  final String accountNumber;

  const BankAccountNumberChanged(this.accountNumber) : super();

  @override
  List<Object> get props => [accountNumber];
}

class ConfirmBankAccountNumberChanged extends BankDetailsEvent {
  final String confirmAccountNumber;

  const ConfirmBankAccountNumberChanged(this.confirmAccountNumber) : super();

  @override
  List<Object> get props => [confirmAccountNumber];
}

class BankDetailsSubmitted extends BankDetailsEvent {
  const BankDetailsSubmitted() : super();
}
