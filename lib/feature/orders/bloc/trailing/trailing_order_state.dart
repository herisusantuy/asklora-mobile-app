part of 'trailing_order_bloc.dart';

class TrailingOrderState extends Equatable {
  final BaseResponse response;
  final double amount;
  final double percentage;
  final double quantity;
  final double initialTrailingPrice;
  final double availableBuyingPower;
  final double availableAmountToSell;
  final double numberOfSellableShares;
  final String buyErrorText;
  final String sellErrorText;

  const TrailingOrderState({
    this.response = const BaseResponse(),
    this.amount = 0,
    this.percentage = 0,
    this.quantity = 0,
    this.initialTrailingPrice = 0,
    required this.availableBuyingPower,
    required this.availableAmountToSell,
    required this.numberOfSellableShares,
    this.buyErrorText = '',
    this.sellErrorText = '',
  });

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
        sellErrorText
      ];

  TrailingOrderState copyWith({
    BaseResponse? response,
    double? amount,
    double? percentage,
    double? quantity,
    double? initialTrailingPrice,
    double? availableBuyingPower,
    double? availableAmountToSell,
    double? numberOfSellableShares,
    String? buyErrorText,
    String? sellErrorText,
  }) {
    return TrailingOrderState(
      response: response ?? this.response,
      amount: amount ?? this.amount,
      percentage: percentage ?? this.percentage,
      quantity: quantity ?? this.quantity,
      initialTrailingPrice: initialTrailingPrice ?? this.initialTrailingPrice,
      availableBuyingPower: availableBuyingPower ?? this.availableBuyingPower,
      availableAmountToSell:
          availableAmountToSell ?? this.availableAmountToSell,
      numberOfSellableShares:
          numberOfSellableShares ?? this.numberOfSellableShares,
      buyErrorText: buyErrorText ?? this.buyErrorText,
      sellErrorText: sellErrorText ?? this.sellErrorText,
    );
  }
}
