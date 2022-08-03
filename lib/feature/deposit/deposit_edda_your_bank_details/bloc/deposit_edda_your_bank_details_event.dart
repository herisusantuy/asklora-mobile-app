part of 'deposit_edda_your_bank_details_bloc.dart';

abstract class DepositEddaYourBankDetailsEvent extends Equatable {
  const DepositEddaYourBankDetailsEvent() : super();

  @override
  List<Object?> get props => [];
}

class BankAccountNumberChanged extends DepositEddaYourBankDetailsEvent {
  final String value;

  const BankAccountNumberChanged(this.value) : super();

  @override
  List<Object> get props => [value];
}

class YourBankDetailsSubmitted extends DepositEddaYourBankDetailsEvent {
  const YourBankDetailsSubmitted() : super();
}
