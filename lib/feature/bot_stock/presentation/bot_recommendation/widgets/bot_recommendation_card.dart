part of '../bot_recommendation_screen.dart';

class BotRecommendationCard extends StatelessWidget {
  final double height;
  final RecommendedBot recommendedBot;
  final double spacing;
  final VoidCallback onTap;
  final bool isDisabled;

  const BotRecommendationCard(
      {required this.onTap,
      required this.height,
      required this.spacing,
      required this.recommendedBot,
      this.isDisabled = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BotType botType = BotType.findByString(recommendedBot.botType);
    return GestureDetector(
      onTap: () => isDisabled ? () {} : onTap(),
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
                  '${botType.uppercaseName} ${recommendedBot.ticker}',
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
                  disabled: isDisabled,
                  buttonPrimarySize: ButtonPrimarySize.small,
                  label: 'FREE TRADE',
                  onTap: onTap),
            )
          ],
        ),
      ),
    );
  }
}
