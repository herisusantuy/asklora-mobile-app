part of '../portfolio_screen.dart';

class BotPortfolioCard extends StatelessWidget {
  final PortfolioBotModel portfolioBotModel;
  final double spacing;
  final double height;

  const BotPortfolioCard(
      {required this.height,
      required this.spacing,
      required this.portfolioBotModel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BotType botType = BotType.findByString(portfolioBotModel.botAppType);
    final Pair<bool, String> expiredDayLeft = expiredDaysLeft(
        DateTime.now(), DateTime.now().add(const Duration(days: 5)));
    return GestureDetector(
      onTap: () => BotPortfolioDetailScreen.open(
          context: context, portfolioBotModel: portfolioBotModel),
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
                      '${botType.upperCaseName} ${portfolioBotModel.ticker}',
                      style: AskLoraTextStyles.h5Italic,
                      maxLines: 1,
                      ellipsis: true,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    CustomTextNew(
                      portfolioBotModel.tickerName,
                      style: AskLoraTextStyles.body2,
                      maxLines: 2,
                      ellipsis: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                PairColumnText(
                  leftTitle: 'Current Price',
                  rightTitle: 'Total P/L',
                  leftSubTitle: portfolioBotModel.latestPrice,
                  rightSubTitle: '0%',
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
                        child: CustomTextNew(
                          'Expires at ${portfolioBotModel.expiredDate ?? '--/--/--'}',
                          style: AskLoraTextStyles.subtitle4
                              .copyWith(color: botType.expiredTextColor),
                          maxLines: 2,
                          ellipsis: true,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          if (portfolioBotModel.freeBot)
            const BotFreeBadge()
        ],
      ),
    );
  }

  Pair<bool, String> expiredDaysLeft(DateTime from, DateTime to) {
    int dayLeft = (to.difference(from).inHours / 24).round();
    if (dayLeft > 3) {
      return Pair(false, 'Expires at ${DateFormat('kk:mm, dd-MM').format(to)}');
    } else {
      return Pair(true, 'Expires in $dayLeft ${dayLeft > 1 ? 'days' : 'day'}!');
    }
  }
}
