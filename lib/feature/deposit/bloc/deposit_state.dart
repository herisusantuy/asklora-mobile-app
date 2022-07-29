part of 'deposit_bloc.dart';

enum DepositPages {
  welcome,
  depositMethod,
  fpsMeaning,
  bankDetails,
  addBankAccount,
  wireTransfer,
  fpsTransfer,
  uploadProof,
  unknown
}

class DepositState extends Equatable {
  final DepositPages depositPages;
  final DepositPages? previousDepositPages;

  const DepositState({
    this.depositPages = DepositPages.unknown,
    this.previousDepositPages,
  }) : super();

  @override
  List<Object?> get props => [depositPages];

  DepositState copyWith({
    DepositPages? depositPages,
    DepositPages? previousDepositPages,
  }) {
    return DepositState(
      depositPages: depositPages ?? this.depositPages,
      previousDepositPages: previousDepositPages ?? this.previousDepositPages,
    );
  }
}
