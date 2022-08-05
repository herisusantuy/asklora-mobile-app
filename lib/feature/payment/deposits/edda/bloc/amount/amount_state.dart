part of 'amount_bloc.dart';

class AmountState extends Equatable {
  final double depositHKDAmount;
  final double depositHKDMinAmount;
  final AmountErrorType depositAmountErrorType;

  const AmountState(
      {this.depositHKDAmount = 0,
      this.depositHKDMinAmount = 10000,
      this.depositAmountErrorType = AmountErrorType.belowMinAmount})
      : super();

  @override
  List<Object> get props => [depositHKDAmount, depositAmountErrorType];

  AmountState copyWith({
    double? depositHKDAmount,
    AmountErrorType? depositAmountErrorType,
  }) {
    return AmountState(
        depositHKDAmount: depositHKDAmount ?? this.depositHKDAmount,
        depositAmountErrorType:
            depositAmountErrorType ?? this.depositAmountErrorType);
  }
}
