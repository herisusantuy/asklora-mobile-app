part of 'deposit_bloc.dart';

enum DepositPages {
  welcome,
  depositMethod,
  fpsMeaning,
  bankDetails,
  addBankAccount,
  unknown
}

class DepositState extends Equatable {
  final DepositPages depositPages;
  const DepositState({
    this.depositPages = DepositPages.unknown,
  }) : super();

  @override
  List<Object?> get props => [depositPages];

  DepositState copyWith({
    DepositPages? depositPages,
  }) {
    return DepositState(
      depositPages: depositPages ?? this.depositPages,
    );
  }
}
