part of 'deposit_bloc.dart';

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
  unknown
}

class DepositState extends Equatable {
  final DepositPageStep depositPages;
  final DepositPageStep? previousDepositPages;

  const DepositState({
    this.depositPages = DepositPageStep.unknown,
    this.previousDepositPages,
  }) : super();

  @override
  List<Object?> get props => [depositPages];

  DepositState copyWith({
    DepositPageStep? depositPages,
    DepositPageStep? previousDepositPages,
  }) {
    return DepositState(
      depositPages: depositPages ?? this.depositPages,
      previousDepositPages: previousDepositPages ?? this.previousDepositPages,
    );
  }
}
