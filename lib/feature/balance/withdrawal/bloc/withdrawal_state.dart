part of 'withdrawal_bloc.dart';

class WithdrawalState extends Equatable {
  final BaseResponse<WithdrawalResponse> response;
  final String withdrawalAmount;
  final String withdrawalAmountErrorText;

  const WithdrawalState({
    this.response = const BaseResponse(),
    this.withdrawalAmount = '',
    this.withdrawalAmountErrorText = '',
  }) : super();

  @override
  List<Object?> get props =>
      [withdrawalAmount, withdrawalAmountErrorText, response];

  WithdrawalState copyWith({
    String? withdrawalAmount,
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

  bool disableWithdrawal(double withdrawableAmount) =>
      double.parse(withdrawalAmount == ''
              ? '0'
              : withdrawalAmount.replaceAll(',', '')) >
          withdrawableAmount ||
      double.parse(withdrawalAmount == ''
              ? '0'
              : withdrawalAmount.replaceAll(',', '')) ==
          0;
}
