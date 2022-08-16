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
  final DepositPageStep depositPages;
  final BankDetails? bankDetails;
  final DepositMethod? depositMethod;
  final BaseResponse<RegisteredBankAccounts> registeredBankAccountResponse;

  const DepositState({
    this.depositPages = DepositPageStep.unknown,
    this.bankDetails,
    this.depositMethod,
    this.registeredBankAccountResponse = const BaseResponse(),
  }) : super();

  @override
  List<Object?> get props =>
      [depositPages, bankDetails, depositMethod, registeredBankAccountResponse];

  DepositState copyWith({
    DepositPageStep? depositPages,
    BankDetails? bankDetails,
    DepositMethod? depositMethod,
    BaseResponse<RegisteredBankAccounts>? registeredBankAccountResponse,
  }) {
    return DepositState(
      depositPages: depositPages ?? this.depositPages,
      bankDetails: bankDetails ?? this.bankDetails,
      depositMethod: depositMethod ?? this.depositMethod,
      registeredBankAccountResponse:
          registeredBankAccountResponse ?? this.registeredBankAccountResponse,
    );
  }
}
