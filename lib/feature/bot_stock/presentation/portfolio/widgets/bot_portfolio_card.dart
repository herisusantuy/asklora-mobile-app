part of '../portfolio_screen.dart';

class BotPortfolioCard extends StatelessWidget {
  final RecommendedBot recommendedBot;
  final double spacing;
  final double height;

  const BotPortfolioCard(
      {required this.height,
      required this.spacing,
      required this.recommendedBot,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BotType botType = BotType.findByString(recommendedBot.botType);
    final Pair<bool, String> expiredDayLeft =
        expiredDaysLeft(DateTime.now(), recommendedBot.expiredDate);
    return GestureDetector(
      onTap: () => BotPortfolioDetailScreen.open(
          context: context, recommendedBot: recommendedBot),
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
                color: botType.primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextNew(
                      '${botType.name} ${recommendedBot.ticker}',
                      style: AskLoraTextStyles.h5Italic,
                      maxLines: 1,
                      ellipsis: true,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    CustomTextNew(
                      recommendedBot.description,
                      style: AskLoraTextStyles.body2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                PairColumnText(
                  title1: 'Current Price',
                  title2: 'Total P/L',
                  subTitle1: recommendedBot.benefit,
                  subTitle2: '+1%',
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                      color: botType.secondaryColor,
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
                          expiredDayLeft.right,
                          style: AskLoraTextStyles.subtitle4,
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
          if (recommendedBot.freeBot)
            Container(
              decoration: BoxDecoration(
                  color: AskLoraColors.primaryMagenta,
                  borderRadius: BorderRadius.circular(11)),
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              height: 20,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.card_giftcard_rounded,
                    size: 14,
                    color: AskLoraColors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomTextNew('FREE',
                      style: AskLoraTextStyles.subtitleAllCap1
                          .copyWith(color: AskLoraColors.white))
                ],
              ),
            )
        ],
      ),
    );
  }

  Pair<bool, String> expiredDaysLeft(DateTime from, DateTime to) {
    int dayLeft = (to.difference(from).inHours / 24).round();
    if (dayLeft > 3) {
      return Pair(false, 'Expired at ${DateFormat('kk:mm, dd-MM').format(to)}');
    } else {
      return Pair(true, 'Expired in $dayLeft ${dayLeft > 1 ? 'days' : 'day'}!');
    }
  }
}
