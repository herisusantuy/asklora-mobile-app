part of '../bot_portfolio_detail_screen.dart';

class BotPortfolioDetailHeader extends StatelessWidget {
  final BotType botType;
  final BotActiveOrderModel botActiveOrderModel;
  const BotPortfolioDetailHeader(
      {required this.botType, required this.botActiveOrderModel, Key? key})
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
            '${botType.upperCaseName} ${botActiveOrderModel.ticker}',
            style: AskLoraTextStyles.h5.copyWith(color: AskLoraColors.charcoal),
          ),
        ],
      ),
    );
  }
}
