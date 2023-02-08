import 'dart:ui';

class BotPortfolioPopUpModel {
  final String title;
  final String subTitle;
  final String buttonLabel;
  final VoidCallback onTap;

  BotPortfolioPopUpModel(
      {required this.title,
      required this.subTitle,
      required this.buttonLabel,
      required this.onTap});
}

enum BotPortfolioPopUpType {
  createAccount,
  investmentStyle,
  kyc,
  redeemBotStock,
  noBotStock
}
