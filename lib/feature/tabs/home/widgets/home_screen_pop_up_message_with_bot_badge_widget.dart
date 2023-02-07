part of '../home_screen_form.dart';

class HomeScreenPopUpWidgetWithBotBadgeWidget extends StatelessWidget {
  const HomeScreenPopUpWidgetWithBotBadgeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoraPopUpMessageWithBotBadge(
      backgroundColor: AskLoraColors.whiteSmoke,
      withLoraImage: true,
      badgePosition: BadgePosition.belowSubtitle,
      title: 'No traded BotStocks.',
      subTitle:
          'You can manage all your investments here after you start trading. Create an account and start trading.',
      botTypes: const [BotType.pullUp, BotType.squat],
      buttonLabel: 'OPEN INVESTMENT ACCOUNT',
      onButtonTap: () {},
    );
  }
}
