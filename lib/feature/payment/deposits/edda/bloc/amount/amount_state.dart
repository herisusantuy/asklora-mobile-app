part of 'amount_bloc.dart';

class AmountState extends Equatable {
  final double depositHKDAmount;
  final double depositHKDMinAmount;
  final AmountErrorType depositAmountErrorType;
  final ResponseState response;

  const AmountState(
      {this.depositHKDAmount = 0,
      this.depositHKDMinAmount = 10000,
      this.depositAmountErrorType = AmountErrorType.belowMinAmount,
      this.response = ResponseState.unknown})
      : super();

  @override
  List<Object> get props =>
      [depositHKDAmount, depositHKDMinAmount, depositAmountErrorType, response];

  AmountState copyWith({
    double? depositHKDAmount,
    AmountErrorType? depositAmountErrorType,
    ResponseState? response,
  }) {
    return AmountState(
      depositHKDAmount: depositHKDAmount ?? this.depositHKDAmount,
      depositAmountErrorType:
          depositAmountErrorType ?? this.depositAmountErrorType,
      response: response ?? this.response,
    );
  }
}
