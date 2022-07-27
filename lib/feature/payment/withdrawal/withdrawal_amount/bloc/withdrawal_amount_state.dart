part of 'withdrawal_amount_bloc.dart';

enum WithdrawalAmountErrorType { exceedMaxAmount, belowMinAmount, unknown }

class WithdrawalAmountState extends Equatable {
  final double withdrawalMaxAmount;
  final double withdrawalUSDAmount;
  final double withdrawalHKDAmount;
  final WithdrawalAmountErrorType withdrawalAmountErrorType;

  const WithdrawalAmountState(
      {this.withdrawalUSDAmount = 0,
      this.withdrawalMaxAmount = 2000,
      this.withdrawalAmountErrorType = WithdrawalAmountErrorType.belowMinAmount,
      this.withdrawalHKDAmount = 0})
      : super();

  @override
  List<Object> get props => [
        withdrawalUSDAmount,
        withdrawalMaxAmount,
        withdrawalHKDAmount,
        withdrawalAmountErrorType
      ];

  WithdrawalAmountState copyWith(
      {double? withdrawalUSDAmount,
      double? withdrawalHKDAmount,
      double? withdrawalMaxAmount,
      WithdrawalAmountErrorType? withdrawalAmountErrorType}) {
    return WithdrawalAmountState(
      withdrawalUSDAmount: withdrawalUSDAmount ?? this.withdrawalUSDAmount,
      withdrawalHKDAmount: withdrawalHKDAmount ?? this.withdrawalHKDAmount,
      withdrawalMaxAmount: withdrawalMaxAmount ?? this.withdrawalMaxAmount,
      withdrawalAmountErrorType:
          withdrawalAmountErrorType ?? this.withdrawalAmountErrorType,
    );
  }
}
