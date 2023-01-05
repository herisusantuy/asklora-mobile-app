part of '../bot_recommendation_screen.dart';

class BotRecommendationCard extends StatelessWidget {
  final double height;
  final RecommendedBot recommendedBot;
  final double spacing;

  const BotRecommendationCard(
      {required this.height,
      required this.spacing,
      required this.recommendedBot,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BotType botType = BotType.findByString(recommendedBot.botType);
    return GestureDetector(
      onTap: () => BotRecommendationDetailScreen.open(
          context: context, recommendedBot: recommendedBot),
      child: Container(
        height: height,
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
                const SizedBox(
                  height: 13,
                ),
                CustomTextNew(
                  'Current Price',
                  style: AskLoraTextStyles.body4,
                ),
                const SizedBox(
                  height: 1,
                ),
                CustomTextNew(
                  recommendedBot.benefit,
                  style: AskLoraTextStyles.subtitle2,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: PrimaryButton(
                  buttonPrimarySize: ButtonPrimarySize.small,
                  label: 'FREE TRADE',
                  onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
