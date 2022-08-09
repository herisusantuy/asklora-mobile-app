part of 'deposit_bloc.dart';

enum DepositMethod { wireTransfer, fps, eDda }

enum DepositPageStep {
  welcome,
  depositMethod,
  fpsMeaning,
  bankDetails,
  addBankAccount,
  wireTransfer,
  fpsTransfer,
  uploadProof,
  acknowledged,
  selectBank,
  eddaInitiate,
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
  final DepositPageStep? previousDepositPages;
  final BankDetails? bankDetails;
  final DepositMethod? depositMethod;

  const DepositState({
    this.depositPages = DepositPageStep.unknown,
    this.previousDepositPages,
    this.bankDetails,
    this.depositMethod,
  }) : super();

  @override
  List<Object?> get props => [depositPages, bankDetails, depositMethod];

  DepositState copyWith({
    DepositPageStep? depositPages,
    DepositPageStep? previousDepositPages,
    BankDetails? bankDetails,
    DepositMethod? depositMethod,
  }) {
    return DepositState(
      depositPages: depositPages ?? this.depositPages,
      previousDepositPages: previousDepositPages ?? this.previousDepositPages,
      bankDetails: bankDetails ?? this.bankDetails,
      depositMethod: depositMethod ?? this.depositMethod,
    );
  }
}
