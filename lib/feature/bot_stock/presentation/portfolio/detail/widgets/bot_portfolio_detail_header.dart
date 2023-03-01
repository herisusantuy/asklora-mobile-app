part of '../bot_portfolio_detail_screen.dart';

class BotPortfolioDetailHeader extends StatelessWidget {
  final BotType botType;
  final PortfolioBotModel portfolioBotModel;
  const BotPortfolioDetailHeader(
      {required this.botType, required this.portfolioBotModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 1.2),
            child: Icon(
              Icons.circle,
              color: AskLoraColors.primaryGreen,
              size: 12,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          CustomTextNew(
            '${botType.upperCaseName} ${portfolioBotModel.ticker}',
            style: AskLoraTextStyles.h5.copyWith(color: AskLoraColors.charcoal),
          ),
        ],
      ),
    );
  }
}
