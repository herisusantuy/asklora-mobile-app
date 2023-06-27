part of '../portfolio_screen.dart';

class BotPortfolioCard extends StatelessWidget {
  final BotActiveOrderModel botActiveOrderModel;
  final double spacing;
  final double height;

  const BotPortfolioCard(
      {required this.height,
      required this.spacing,
      required this.botActiveOrderModel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BotType botType =
        BotType.findByString(botActiveOrderModel.botAppsName);
    final Pair<bool, String> expiredDayLeft = expiredDaysLeft(
        context,

        ///TODO : LATER MAKE SURE EXPIRED DATE IS NOT NULLABLE
        DateTime.now(),
        botActiveOrderModel.expireDate != null
            ? DateTime.parse(botActiveOrderModel.expireDate!)
            : null);
    return GestureDetector(
      onTap: () => BotPortfolioDetailScreen.open(
          context: context, botActiveOrderModel: botActiveOrderModel),
      child: Stack(
        children: [
          Container(
            height: height,
            margin: const EdgeInsets.only(top: 10),
            width: (MediaQuery.of(context).size.width -
                    AppValues.screenHorizontalPadding.left -
                    AppValues.screenHorizontalPadding.right -
                    spacing) /
                2,
            padding: const EdgeInsets.fromLTRB(14, 20, 14, 11),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: botType.primaryBgColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextNew(
                      '${botType.upperCaseName} ${botActiveOrderModel.symbol}',
                      style: AskLoraTextStyles.h5,
                      maxLines: 1,
                      ellipsis: true,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    AutoSizedTextWidget(
                      botActiveOrderModel.tickerName,
                      style: AskLoraTextStyles.body2,
                      maxLines: 2,
                      minFontSize: 9,
                      ellipsis: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                PairColumnTextWithAutoSizedText(
                  leftTitle: S.of(context).portfolioCurrentPrice(''),
                  rightTitle: S.of(context).portfolioTotalPL,
                  leftSubTitle: botActiveOrderModel.currentPrice.toString(),
                  rightSubTitle: botActiveOrderModel.totalPnLPctString,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                      color: botType.secondaryBgColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      if (expiredDayLeft.left)
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.warning,
                            color: AskLoraColors.charcoal,
                            size: 14,
                          ),
                        ),
                      Expanded(
                        child: AutoSizedTextWidget(expiredDayLeft.right,
                            style: AskLoraTextStyles.subtitle4
                                .copyWith(color: botType.expiredTextColor),
                            maxLines: 1),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          if (botActiveOrderModel.isDummy) const FreeBotBadge()
        ],
      ),
    );
  }

  Pair<bool, String> expiredDaysLeft(
      BuildContext context, DateTime from, DateTime? to) {
    ///TODO : LATER MAKE SURE EXPIRED DATE IS NOT NULLABLE
    if (to != null) {
      int dayLeft = (to.difference(from).inHours / 24).round().abs();
      if (dayLeft > 3) {
        return Pair(
          false,
          S.of(context).portfolioDetailExpiredAt(
                DateFormat('kk:mm, dd-MM').format(to),
              ),
        );
      } else {
        return Pair(
            true, S.of(context).portfolioDetailExpiredIn(dayLeft.toString()));
      }
    } else {
      return Pair(
        false,
        S.of(context).portfolioDetailExpiredAt('-'),
      );
    }
  }
}
