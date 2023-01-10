part of '../bot_recommendation_screen.dart';

class BotLearnMoreBottomSheet extends StatelessWidget {
  const BotLearnMoreBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppValues.screenHorizontalPadding.copyWith(top: 32),
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close))),
          CustomTextNew(
            'Free AI Bot-stock for you to trade and learn',
            style: AskLoraTextStyles.h4.copyWith(color: AskLoraColors.charcoal),
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextNew(
            'Redeem the free Botstock by achieving the followings:',
            style: AskLoraTextStyles.h6.copyWith(color: AskLoraColors.charcoal),
          ),
          const SizedBox(
            height: 18,
          ),
          _achievementCard(
              title: 'Complete 3 Milestones in 3 Months',
              subTitle:
                  'You will master how Botstock investment works and trades with 2 Botstocks'),
          const SizedBox(
            height: 12,
          ),
          _achievementCard(
              title: 'Let your free Botstock trade for you',
              subTitle: 'Sit back and experience investing like never before'),
          const SizedBox(
            height: 12,
          ),
          _achievementCard(
              title: 'Stay on Core Plans after 3 Months',
              subTitle:
                  'It costs USD12.5 per month, but I promise you your free Botstock will generate more than USD68 for you'),
        ],
      ),
    );
  }

  Widget _achievementCard({required String title, required String subTitle}) =>
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: AskLoraColors.lightGray,
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNew(
              title,
              style: AskLoraTextStyles.subtitle1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextNew(
              subTitle,
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.charcoal),
            ),
          ],
        ),
      );
}
