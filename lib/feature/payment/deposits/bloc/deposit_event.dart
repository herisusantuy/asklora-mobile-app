part of 'deposit_bloc.dart';

abstract class DepositEvent extends Equatable {
  const DepositEvent() : super();

  @override
  List<Object?> get props => [];
}

class DepositMethodSelected extends DepositEvent {
  final DepositMethod depositMethod;

  const DepositMethodSelected(this.depositMethod) : super();

  @override
  List<Object?> get props => [depositMethod];
}

class BankSelected extends DepositEvent {
  final BankDetails bankDetails;
  final int? timeStamp;

  const BankSelected(this.bankDetails, this.timeStamp) : super();

  @override
  List<Object?> get props => [bankDetails, timeStamp];
}
