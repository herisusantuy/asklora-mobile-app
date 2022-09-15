part of 'limit_bloc.dart';

class LimitOrderState extends Equatable {
  final BaseResponse response;
  final double limit;
  final double quantity;
  final double estimateTotal;
  final double availableBuyingPower;
  final double availableAmountToSell;
  final double numberOfSellableShares;
  final String buyErrorText;
  final String sellErrorText;

  const LimitOrderState(
      {this.response = const BaseResponse(),
      this.limit = 0,
      this.quantity = 0,
      this.estimateTotal = 0,
      required this.availableBuyingPower,
      required this.availableAmountToSell,
      required this.numberOfSellableShares,
      this.buyErrorText = '',
      this.sellErrorText = ''})
      : super();

  @override
  List<Object?> get props => [
        response,
        limit,
        quantity,
        estimateTotal,
        availableBuyingPower,
        buyErrorText,
        sellErrorText
      ];

  LimitOrderState copyWith(
      {BaseResponse? response,
      double? limit,
      double? quantity,
      double? estimateTotal,
      double? availableBuyingPower,
      double? availableAmountToSell,
      double? numberOfSellableShares,
      String? buyErrorText,
      String? sellErrorText}) {
    return LimitOrderState(
      response: response ?? this.response,
      limit: limit ?? this.limit,
      quantity: quantity ?? this.quantity,
      estimateTotal: estimateTotal ?? this.estimateTotal,
      availableAmountToSell:
          availableAmountToSell ?? this.availableAmountToSell,
      numberOfSellableShares:
          numberOfSellableShares ?? this.numberOfSellableShares,
      availableBuyingPower: availableBuyingPower ?? this.availableBuyingPower,
      buyErrorText:
          (estimateTotal ?? this.estimateTotal) > this.availableBuyingPower
              ? 'Amount exceed the amount of available buying power'
              : '',
      sellErrorText:
          (estimateTotal ?? this.estimateTotal) > this.availableAmountToSell
              ? 'Amount exceed the available amount to sell'
              : '',
    );
  }

  bool disabledConfirmButton(TransactionType transactionType) {
    if (transactionType == TransactionType.buy) {
      if (limit != 0 && quantity != 0 && buyErrorText.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (transactionType == TransactionType.sell) {
      if (limit != 0 && quantity != 0 && sellErrorText.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}
