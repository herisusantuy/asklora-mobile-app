part of 'bank_account_bloc.dart';

abstract class BankAccountEvent extends Equatable {
  const BankAccountEvent() : super();

  @override
  List<Object?> get props => [];
}

class RegisteredBankAccountCheck extends BankAccountEvent {
  const RegisteredBankAccountCheck() : super();

  @override
  List<Object?> get props => [];
}

class BankAccountSubmitted extends BankAccountEvent {
  final bool shouldValidateName;
  final AddBankAccountRequest addBankAccountRequest;

  const BankAccountSubmitted(
      {required this.addBankAccountRequest, this.shouldValidateName = false})
      : super();

  @override
  List<Object> get props => [];
}
