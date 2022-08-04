part of 'amount_bloc.dart';

enum AmountErrorType { exceedMaxAmount, belowMinAmount, unknown }

class AmountState extends Equatable {
  final double withdrawalMaxAmount;
  final double withdrawalUSDAmount;
  final double withdrawalHKDAmount;
  final AmountErrorType withdrawalAmountErrorType;

  const AmountState(
      {this.withdrawalUSDAmount = 0,
      this.withdrawalMaxAmount = 2000,
      this.withdrawalAmountErrorType = AmountErrorType.belowMinAmount,
      this.withdrawalHKDAmount = 0})
      : super();

  @override
  List<Object> get props => [
        withdrawalUSDAmount,
        withdrawalMaxAmount,
        withdrawalHKDAmount,
        withdrawalAmountErrorType
      ];

  AmountState copyWith(
      {double? withdrawalUSDAmount,
      double? withdrawalHKDAmount,
      double? withdrawalMaxAmount,
      AmountErrorType? withdrawalAmountErrorType}) {
    return AmountState(
      withdrawalUSDAmount: withdrawalUSDAmount ?? this.withdrawalUSDAmount,
      withdrawalHKDAmount: withdrawalHKDAmount ?? this.withdrawalHKDAmount,
      withdrawalMaxAmount: withdrawalMaxAmount ?? this.withdrawalMaxAmount,
      withdrawalAmountErrorType:
          withdrawalAmountErrorType ?? this.withdrawalAmountErrorType,
    );
  }
}
