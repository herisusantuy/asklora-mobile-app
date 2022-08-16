part of 'deposit_bloc.dart';

abstract class DepositEvent extends Equatable {
  const DepositEvent() : super();

  @override
  List<Object?> get props => [];
}

class PageChanged extends DepositEvent {
  final DepositPageStep depositPages;

  const PageChanged(this.depositPages) : super();

  @override
  List<Object?> get props => [depositPages];
}

class DepositMethodSelected extends DepositEvent {
  final DepositMethod depositMethod;

  const DepositMethodSelected(this.depositMethod) : super();

  @override
  List<Object?> get props => [depositMethod];
}

class BankSelected extends DepositEvent {
  final BankDetails bankDetails;

  const BankSelected(this.bankDetails) : super();

  @override
  List<Object?> get props => [bankDetails];
}

class RegisteredBankAccountCheck extends DepositEvent {
  const RegisteredBankAccountCheck() : super();

  @override
  List<Object?> get props => [];
}
