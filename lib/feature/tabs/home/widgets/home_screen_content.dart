part of '../home_screen_form.dart';

class HomeScreenContent extends StatelessWidget {
  final Widget _spaceHeightSmall = const SizedBox(
    height: 20,
  );

  final Widget _spaceHeightBig = const SizedBox(
    height: 50,
  );

  const HomeScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
            previous.userJourney != current.userJourney,
        builder: (context, state) => Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                  children: _getContents(
                      context: context, userJourney: state.userJourney)),
            ));
  }

  List<Widget> _getContents(
      {required BuildContext context, required UserJourney userJourney}) {
    switch (userJourney) {
      case UserJourney.personalisation:
        return [
          const HomeInvestmentStyle(
            showAdditionalInfo: true,
          ),
          _spaceHeightBig,
          HomePopUpMessage(
            title: 'Your first Botstock is on me!',
            subTitle:
                'Open your account to receive a free gift bot stock. Trade it without risk and experience how it helps you save time and effort. Redeem it for real after 3 months.',
            buttonLabel: 'Answer Personalisation Questions',
            onPrimaryButtonTap: () => SignUpScreen.open(context),
            backgroundColor: AskLoraColors.primaryGreen,
          ),
          _spaceHeightSmall,
          const HomeNeedHelpButton(),
        ];
      case UserJourney.createAccount:
        return [
          const HomeInvestmentStyle(
            showAdditionalInfo: true,
          ),
          _spaceHeightBig,
          HomePopUpMessage(
            title: 'Your first Botstock is on me!',
            subTitle:
                'Open your account to receive a free gift bot stock. Trade it without risk and experience how it helps you save time and effort. Redeem it for real after 3 months.',
            buttonLabel: 'SIGN UP',
            onPrimaryButtonTap: () => SignUpScreen.open(context),
            backgroundColor: AskLoraColors.primaryGreen,
          ),
          _spaceHeightSmall,
          const HomeNeedHelpButton(),
        ];
      case UserJourney.investmentStyle:
        return [
          const HomeInvestmentStyle(
            showPrimaryButton: true,
          ),
          _spaceHeightSmall,
          HomePopUpMessage(
            title: 'Let me Invest in you.',
            subTitle:
                'What strategy and stocks fit you? Fill in the Investment style questions and I will figure it out right away! The more I know about you, the better recommendations I can offer!',
            buttonLabel: 'DEFINE INVESTMENT STYLE',
            secondaryButtonLabel: 'HOW IT WORKS',
            onSecondaryButtonTap: () {},
            onPrimaryButtonTap: () => SignUpScreen.open(context),
            backgroundColor: AskLoraColors.primaryGreen,
          ),
          _spaceHeightSmall,
          const HomeNeedHelpButton(),
        ];
      case UserJourney.kyc:
        return [
          HomePopUpMessage(
            title: 'Get a FREE Botstock (US\$68)!',
            subTitle:
                'Experience automated and personalised stock trading. Receive free bot stock and redeem it after completing the required milestones.',
            buttonLabel: 'OPEN INVESTMENT ACCOUNT',
            secondaryButtonLabel: 'LEARN MORE',
            onSecondaryButtonTap: () {},
            onPrimaryButtonTap: () => SignUpScreen.open(context),
            backgroundColor: AskLoraColors.whiteSmoke,
          ),
          _spaceHeightBig,
          const HomeInvestmentStyle(),
          _spaceHeightSmall,
          HomePopUpMessage(
            title: 'Start with your first milestone!',
            subTitle:
                'Complete your account opening and experience your first trade with an AI strategy.  ',
            buttonLabel: 'OPEN INVESTMENT ACCOUNT',
            onPrimaryButtonTap: () => SignUpScreen.open(context),
            backgroundColor: AskLoraColors.lime,
            pngImage: 'home_dumbell',
            boxTopMargin: 105,
          ),
          _spaceHeightSmall,
          const HomeNeedHelpButton(),
        ];
      case UserJourney.freeBotStock:
        return [
          HomePopUpMessage(
            title: 'Get the FREE Botstock (US\$68)!',
            subTitle:
                'Experience automated and personalised stock trading. Receive free bot stock and redeem it after completing the required milestones.',
            buttonLabel: 'GET IT NOW',
            secondaryButtonLabel: 'LEARN MORE',
            onSecondaryButtonTap: () {},
            onPrimaryButtonTap: () => GiftBotStockWelcomeScreen.open(context),
            backgroundColor: AskLoraColors.whiteSmoke,
          ),
          _spaceHeightBig,
          const HomeInvestmentStyle(),
          _spaceHeightSmall,
          const HomeNeedHelpButton(),
        ];
      case UserJourney.deposit:
        return [
          const HomeMilestoneCompletionReminder(),
          _spaceHeightBig,
          const HomeInvestmentStyle(),
          _spaceHeightSmall,
          const HomeNeedHelpButton(),
        ];
      case UserJourney.learnBotPlank:
        return [
          const HomeMilestoneCompletionReminder(),
          _spaceHeightBig,
          const HomeInvestmentStyle(),
          _spaceHeightSmall,
          const HomeNeedHelpButton(),
        ];
      default:
        return [
          const HomeInvestmentStyle(),
          _spaceHeightSmall,
          const HomePopUpWidgetWithBotBadge(),
          _spaceHeightSmall,
          const HomeNeedHelpButton(),
        ];
    }
  }
}
