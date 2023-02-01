part of 'withdrawal_bloc.dart';

class WithdrawalState extends Equatable {
  final BaseResponse<WithdrawalResponse> response;
  final double withdrawalAmount;
  final String withdrawalAmountErrorText;

  const WithdrawalState({
    this.response = const BaseResponse(),
    this.withdrawalAmount = 0,
    this.withdrawalAmountErrorText = '',
  }) : super();

  @override
  List<Object?> get props =>
      [withdrawalAmount, withdrawalAmountErrorText, response];

  WithdrawalState copyWith({
    double? withdrawalAmount,
    String? withdrawalAmountErrorText,
    BaseResponse<WithdrawalResponse>? response,
  }) {
    return WithdrawalState(
      response: response ?? this.response,
      withdrawalAmount: withdrawalAmount ?? this.withdrawalAmount,
      withdrawalAmountErrorText:
          withdrawalAmountErrorText ?? this.withdrawalAmountErrorText,
    );
  }
}
