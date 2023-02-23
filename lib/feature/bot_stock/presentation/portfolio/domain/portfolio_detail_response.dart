import 'package:json_annotation/json_annotation.dart';

part 'portfolio_detail_response.g.dart';

@JsonSerializable()
class PortfolioDetailResponse {
  final double totalPortfolio;
  final double withdrawableAmount;
  final double buyingPower;
  final double totalBotStockValues;
  final double profit;

  PortfolioDetailResponse({
    this.totalPortfolio = 100000,
    this.withdrawableAmount = 5000,
    this.buyingPower = 3000,
    this.totalBotStockValues = 7000,
    this.profit = 200,
  });

  factory PortfolioDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PortfolioDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioDetailResponseToJson(this);

  PortfolioDetailResponse copyWith({
    double? totalPortfolio,
    double? withdrawableAmount,
    double? buyingPower,
    double? totalBotStockValues,
    double? profit,
  }) =>
      PortfolioDetailResponse(
        totalPortfolio: totalPortfolio ?? this.totalPortfolio,
        withdrawableAmount: withdrawableAmount ?? this.withdrawableAmount,
        buyingPower: buyingPower ?? this.buyingPower,
        totalBotStockValues: totalBotStockValues ?? this.totalBotStockValues,
        profit: profit ?? this.profit,
      );
}
