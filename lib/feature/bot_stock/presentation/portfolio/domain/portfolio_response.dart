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
    this.totalPortfolio = 100000,
    this.withdrawableAmount = 5000,
    this.buyingPower = 3000,
    this.totalBotStockValues = 7000,
    this.profit = 200,
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
