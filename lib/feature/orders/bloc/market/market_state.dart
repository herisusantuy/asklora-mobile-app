part of 'market_bloc.dart';

class MarketState extends Equatable {
  final BaseResponse response;
  final double amount;
  final double sharesAmount;
  final double estimateTotal;
  final double availableBuyingPower;
  final double numberOfBuyableShares;
  final String errorText;

  const MarketState(
      {this.response = const BaseResponse(),
      this.amount = 0,
      this.sharesAmount = 0,
      this.estimateTotal = 0,
      this.availableBuyingPower = 0,
      this.numberOfBuyableShares = 0,
      this.errorText = ''})
      : super();

  @override
  List<Object?> get props => [
        response,
        amount,
        sharesAmount,
        estimateTotal,
        availableBuyingPower,
        numberOfBuyableShares
      ];

  MarketState copyWith(
      {BaseResponse? response,
      double? amount,
      double? sharesAmount,
      double? estimateTotal,
      double? availableBuyingPower,
      double? numberOfBuyableShares,
      String? errorText}) {
    return MarketState(
      response: response ?? this.response,
      amount: amount ?? this.amount,
      sharesAmount: sharesAmount ?? this.sharesAmount,
      estimateTotal: estimateTotal ?? this.estimateTotal,
      availableBuyingPower: availableBuyingPower ?? this.availableBuyingPower,
      numberOfBuyableShares:
          numberOfBuyableShares ?? this.numberOfBuyableShares,
      errorText: errorText ?? this.errorText,
    );
  }
}
