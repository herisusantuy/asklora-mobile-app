part of 'deposit_bloc.dart';

enum DepositMethod { wire, fps, eDda }

extension Type on DepositMethod {
  String get value {
    switch (this) {
      case DepositMethod.wire:
        return 'WIRE';
      case DepositMethod.fps:
        return 'FPS';
      case DepositMethod.eDda:
        return 'EDDA';
      default:
        return '';
    }
  }

  String get name {
    switch (this) {
      case DepositMethod.wire:
        return 'Wire';
      case DepositMethod.fps:
        return 'FPS';
      case DepositMethod.eDda:
        return 'eDDA';
      default:
        return '';
    }
  }
}

enum DepositPageStep {
  welcome,
  depositMethod,
  fpsMeaning,
  addBankAccount,
  wireTransfer,
  fpsTransfer,
  uploadProof,
  acknowledged,
  returningUser,
  selectBank,
  wireTransferBankDetails,
  fpsBankDetails,
  eDdaInitiate,
  eDdaMeaning,
  eDdaBankDetails,
  eDdaBankDetailsProgress,
  eDdaBankDetailsSuccess,
  eDdaDepositAmount,
  eDdaAcknowledged,
  eDdaFinished,
  unknown
}

class DepositState extends Equatable {
  final DepositEvent? depositEvent;
  final BankDetails? bankDetails;
  final DepositMethod? depositMethod;
  final bool useExistingBankAccount;

  const DepositState(
      {this.depositEvent,
      this.bankDetails,
      this.depositMethod,
      this.useExistingBankAccount = false})
      : super();

  @override
  List<Object?> get props =>
      [depositEvent, bankDetails, depositMethod, useExistingBankAccount];

  DepositState copyWith(
      {DepositEvent? depositEvent,
      BankDetails? bankDetails,
      DepositMethod? depositMethod,
      bool? useExistingBankAccount}) {
    return DepositState(
      depositEvent: depositEvent ?? this.depositEvent,
      bankDetails: bankDetails ?? this.bankDetails,
      depositMethod: depositMethod ?? this.depositMethod,
      useExistingBankAccount:
          useExistingBankAccount ?? this.useExistingBankAccount,
    );
  }
}
