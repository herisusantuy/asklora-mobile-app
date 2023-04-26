import 'package:json_annotation/json_annotation.dart';

part 'portfolio_response.g.dart';

@JsonSerializable()
class PortfolioResponse {
  final double totalPortfolio;
  final double withdrawableAmount;
  final double buyingPower;
  final double totalBotStockValues;
  final double profit;

  PortfolioResponse({
    this.totalPortfolio = 0,
    this.withdrawableAmount = 0,
    this.buyingPower = 0,
    this.totalBotStockValues = 0,
    this.profit = 0,
  });

  factory PortfolioResponse.fromJson(Map<String, dynamic> json) =>
      _$PortfolioResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioResponseToJson(this);

  PortfolioResponse copyWith({
    double? totalPortfolio,
    double? withdrawableAmount,
    double? buyingPower,
    double? totalBotStockValues,
    double? profit,
  }) =>
      PortfolioResponse(
        totalPortfolio: totalPortfolio ?? this.totalPortfolio,
        withdrawableAmount: withdrawableAmount ?? this.withdrawableAmount,
        buyingPower: buyingPower ?? this.buyingPower,
        totalBotStockValues: totalBotStockValues ?? this.totalBotStockValues,
        profit: profit ?? this.profit,
      );
}
