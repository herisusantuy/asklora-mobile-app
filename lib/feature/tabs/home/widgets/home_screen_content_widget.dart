part of '../home_screen_form.dart';

class HomeScreenContentWidget extends StatelessWidget {
  final Widget _spaceHeightSmall = const SizedBox(
    height: 20,
  );

  final Widget _spaceHeightBig = const SizedBox(
    height: 50,
  );

  const HomeScreenContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) =>
          previous.userJourney != current.userJourney,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          children:
              _getContents(context: context, userJourney: state.userJourney),
        ),
      ),
    );
  }

  List<Widget> _getContents(
      {required BuildContext context, required UserJourney userJourney}) {
    switch (userJourney) {
      case UserJourney.personalisation:
        return [
          const HomeScreenInvestmentStyleWidget(
            showAdditionalInfo: true,
          ),
          _spaceHeightBig,
          HomeScreenPopUpMessageWidget(
            title:
                'Let’s answer your personalisation questions so we can start giving you your Botstock recommendations!',
            subTitle:
                'Afterwards, open your account to receive a free gift Botstock',
            buttonLabel: 'Answer Personalisation Questions',
            onPrimaryButtonTap: () => PpiScreen.open(
              context,
              arguments: Pair(QuestionPageType.personalisation,
                  QuestionPageStep.personalisation),
            ),
            backgroundColor: AskLoraColors.lime,
          ),
          _spaceHeightSmall,
          const HomeScreenNeedHelpButtonWidget(),
        ];
      case UserJourney.createAccount:
        return [
          const HomeScreenInvestmentStyleWidget(
            showAdditionalInfo: true,
          ),
          _spaceHeightBig,
          HomeScreenPopUpMessageWidget(
            title: 'Your first Botstock is on me!',
            subTitle:
                'Open your account to receive a free gift bot stock. Trade it without risk and experience how it helps you save time and effort. Redeem it for real after 3 months.',
            buttonLabel: 'SIGN UP',
            onPrimaryButtonTap: () => SignUpScreen.open(context),
            backgroundColor: AskLoraColors.primaryGreen,
          ),
          _spaceHeightSmall,
          const HomeScreenNeedHelpButtonWidget(),
        ];
      case UserJourney.investmentStyle:
        return [
          const HomeScreenInvestmentStyleWidget(
            showPrimaryButton: true,
          ),
          _spaceHeightSmall,
          HomeScreenPopUpMessageWidget(
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
          const HomeScreenNeedHelpButtonWidget(),
        ];
      case UserJourney.kyc:
        return [
          HomeScreenPopUpMessageWidget(
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
          const HomeScreenInvestmentStyleWidget(),
          _spaceHeightSmall,
          HomeScreenPopUpMessageWidget(
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
          const HomeScreenNeedHelpButtonWidget(),
        ];
      case UserJourney.freeBotStock:
        return [
          HomeScreenPopUpMessageWidget(
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
          const HomeScreenInvestmentStyleWidget(),
          _spaceHeightSmall,
          const HomeScreenNeedHelpButtonWidget(),
        ];
      case UserJourney.deposit:
        return [
          const HomeScreenMilestoneCompletionReminderWidget(),
          _spaceHeightBig,
          const HomeScreenInvestmentStyleWidget(),
          _spaceHeightSmall,
          const HomeScreenNeedHelpButtonWidget(),
        ];
      case UserJourney.learnBotPlank:
        return [
          const HomeScreenMilestoneCompletionReminderWidget(),
          _spaceHeightBig,
          const HomeScreenInvestmentStyleWidget(),
          _spaceHeightSmall,
          const HomeScreenNeedHelpButtonWidget(),
        ];
      default:
        return [
          const HomeScreenInvestmentStyleWidget(),
          _spaceHeightSmall,
          const HomeScreenPopUpWidgetWithBotBadgeWidget(),
          _spaceHeightSmall,
          const HomeScreenNeedHelpButtonWidget(),
        ];
    }
  }
}
