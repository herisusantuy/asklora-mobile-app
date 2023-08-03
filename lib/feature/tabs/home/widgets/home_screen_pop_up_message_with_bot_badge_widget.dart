part of '../home_screen_form.dart';

class HomeScreenPopUpWidgetWithBotBadgeWidget extends StatelessWidget {
  const HomeScreenPopUpWidgetWithBotBadgeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoraPopUpMessageWithBotBadge(
      backgroundColor: AskLoraColors.whiteSmoke,
      badgePosition: BadgePosition.belowSubtitle,
      title: 'No traded BotStocks.',
      subTitle:
          'You can manage all your investments here after you start trading. Create an account and start trading.',
      botTypes: const [BotType.pullUp, BotType.squat],
      botRecommendationModel: const BotRecommendationModel(
          38659,
          'CLASSIC_classic_003846',
          null,
          'CLASSIC',
          'Plank',
          'WTW.O',
          'WILLIS TOWERS WATSON PLC',
          'WTW',
          '213.16',
          '2023-08-03T05:44:13.098144',
          '2023-08-03T05:44:13.098148',
          '2 Weeks'),
      buttonLabel: S.of(context).openInvestmentAccount,
      onButtonTap: () {},
    );
  }
}
