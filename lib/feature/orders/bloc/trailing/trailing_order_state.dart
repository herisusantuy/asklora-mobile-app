part of 'trailing_order_bloc.dart';

class TrailingOrderState extends Equatable {
  final BaseResponse response;
  final double amount;
  final double percentage;
  final double quantity;
  final double initialTrailingPrice;
  final double estimateTotal;
  final double availableBuyingPower;
  final double availableAmountToSell;
  final double numberOfSellableShares;
  final String buyErrorText;
  final String sellErrorText;
  final TrailType trailType;

  const TrailingOrderState(
      {this.response = const BaseResponse(),
      this.amount = 0,
      this.percentage = 0,
      this.quantity = 0,
      this.initialTrailingPrice = 0,
      this.estimateTotal = 0,
      required this.availableBuyingPower,
      required this.availableAmountToSell,
      required this.numberOfSellableShares,
      this.buyErrorText = '',
      this.sellErrorText = '',
      this.trailType = TrailType.amount});

  @override
  List<Object?> get props => [
        response,
        amount,
        percentage,
        quantity,
        initialTrailingPrice,
        availableBuyingPower,
        availableAmountToSell,
        numberOfSellableShares,
        buyErrorText,
        sellErrorText,
        trailType,
      ];

  TrailingOrderState copyWith({
    BaseResponse? response,
    double? amount,
    double? percentage,
    double? quantity,
    double? initialTrailingPrice,
    double? estimateTotal,
    double? availableBuyingPower,
    double? availableAmountToSell,
    double? numberOfSellableShares,
    String? buyErrorText,
    String? sellErrorText,
    TrailType? trailType,
  }) {
    return TrailingOrderState(
      response: response ?? this.response,
      amount: amount ?? this.amount,
      percentage: percentage ?? this.percentage,
      quantity: quantity ?? this.quantity,
      initialTrailingPrice: initialTrailingPrice ?? this.initialTrailingPrice,
      estimateTotal: estimateTotal ?? this.estimateTotal,
      availableBuyingPower: availableBuyingPower ?? this.availableBuyingPower,
      availableAmountToSell:
          availableAmountToSell ?? this.availableAmountToSell,
      numberOfSellableShares:
          numberOfSellableShares ?? this.numberOfSellableShares,
      buyErrorText:
          (estimateTotal ?? this.estimateTotal) > this.availableBuyingPower
              ? 'Amount exceed the amount of available buying power'
              : '',
      sellErrorText:
          (estimateTotal ?? this.estimateTotal) > this.availableAmountToSell
              ? 'Amount exceed the available amount to sell'
              : '',
      trailType: trailType ?? this.trailType,
    );
  }

  // bool disableConfirmButton(
  //     TransactionType transactionType, TrailType trailType) {
  //   if (transactionType == TransactionType.buy) {
  //     if (trailType == TrailType.amount) {
  //       if (amount != 0 &&
  //           quantity != 0 &&
  //           estimateTotal != 0 &&
  //           buyErrorText.isEmpty) {
  //         return false;
  //       }
  //     } else if (trailType == TrailType.percentage) {
  //       if (percentage != 0 &&
  //           quantity != 0 &&
  //           estimateTotal != 0 &&
  //           buyErrorText.isEmpty) {
  //         return false;
  //       }
  //     }
  //     return true;
  //   } else if (transactionType == TransactionType.sell) {
  //     if (trailType == TrailType.amount) {
  //       if (amount != 0 &&
  //           quantity != 0 &&
  //           estimateTotal != 0 &&
  //           sellErrorText.isEmpty) {
  //         return false;
  //       }
  //     } else if (trailType == TrailType.percentage) {
  //       if (percentage != 0 &&
  //           quantity != 0 &&
  //           estimateTotal != 0 &&
  //           sellErrorText.isEmpty) {
  //         return false;
  //       }
  //     }
  //     return true;
  //   } else {
  //     return true;
  //   }
  // }

  bool disableConfirmButton(TransactionType transactionType) {
    if (transactionType == TransactionType.buy) {
      if ((amount != 0 || percentage != 0) &&
          quantity != 0 &&
          estimateTotal != 0 &&
          buyErrorText.isEmpty) {
        return false;
      }
      return true;
    } else if (transactionType == TransactionType.sell) {
      if ((amount != 0 || percentage != 0) &&
          quantity != 0 &&
          estimateTotal != 0 &&
          sellErrorText.isEmpty) {
        return false;
      }
      return true;
    } else {
      return true;
    }
  }
}
