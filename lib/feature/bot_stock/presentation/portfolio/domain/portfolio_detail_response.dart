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
}
