enum BotPortfolioPopUpType {
  createAccount,
  investmentStyle,
  kyc,
  redeemBotStock,
  deposit,
  noBotStock,
  pendingReview
}

enum BotPortfolioStatus {
  pending('Pending', 'pending'),
  active('Active', 'active');

  final String name;
  final String value;
  const BotPortfolioStatus(this.name, this.value);

  static BotPortfolioStatus findByString(String botType) =>
      BotPortfolioStatus.values
          .firstWhere((element) => element.value == botType);
}
