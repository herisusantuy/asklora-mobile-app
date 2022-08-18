part of 'deposit_bloc.dart';

abstract class DepositEvent extends Equatable {
  const DepositEvent() : super();

  @override
  List<Object?> get props => [];
}

class DepositMethodSelected extends DepositEvent {
  final Function(DepositPageStep) whenDone;
  final DepositMethod depositMethod;

  const DepositMethodSelected(this.depositMethod, {required this.whenDone})
      : super();

  @override
  List<Object?> get props => [depositMethod, whenDone];
}

class BankSelected extends DepositEvent {
  final Function whenDone;
  final BankDetails bankDetails;

  const BankSelected(this.bankDetails, {required this.whenDone}) : super();

  @override
  List<Object?> get props => [bankDetails];
}

class RegisteredBankAccountCheck extends DepositEvent {
  final Function whenDone;

  const RegisteredBankAccountCheck({required this.whenDone}) : super();

  @override
  List<Object?> get props => [whenDone];
}
