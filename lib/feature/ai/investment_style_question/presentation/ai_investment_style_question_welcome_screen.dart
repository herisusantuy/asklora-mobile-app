import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../generated/l10n.dart';
import '../../../onboarding/ppi/presentation/investment_style_question/isq/bloc/isq_onboarding_bloc.dart';
import '../../../tabs/for_you/investment_style/presentation/ai_investment_style_question_for_you_screen.dart';
import '../../presentation/ai_welcome_screen.dart';
import '../../presentation/widgets/ai_welcome_subtitle_text.dart';
import '../../../onboarding/ppi/presentation/investment_style_question/isq/presentation/ai_investment_style_question_onboarding_screen.dart';
import '../../../../core/presentation/ai/utils/ai_utils.dart';

enum ISQType { onboarding, forYou }

class AiInvestmentStyleQuestionWelcomeScreen extends StatelessWidget {
  final ISQType isqType;
  final AiThemeType aiThemeType;
  static const String route = '/ai_investment_style_question_welcome_screen';

  const AiInvestmentStyleQuestionWelcomeScreen(
      {this.isqType = ISQType.onboarding,
      this.aiThemeType = AiThemeType.light,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          IsqOnBoardingBloc(sharedPreference: SharedPreference()),
      child: BlocConsumer<IsqOnBoardingBloc, IsqOnBoardingState>(
        listener: isqOnboardingBlocListener,
        listenWhen: isqOnboardingBlocListenWhen,
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              context.read<IsqOnBoardingBloc>().add(BackButtonClicked());
              return false;
            },
            child: AiWelcomeScreen(
              enableBackgroundImage: isqType == ISQType.onboarding,
              aiThemeType: aiThemeType,
              title: S.of(context).timeForInvestmentStyleQuestion,
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: AiWelcomeSubtitleText(
                  aiThemeType: aiThemeType,
                  subTitle:
                      S.of(context).isqWillHelpMeUnderstandWhatKindOfStocks,
                ),
              ),
              onBottomButtonTap: () {
                if (isqType == ISQType.onboarding) {
                  AiInvestmentStyleQuestionOnboardingScreen.open(context);
                } else {
                  AiInvestmentStyleQuestionForYouScreen.open(context,
                      aiThemeType: aiThemeType);
                }
              },
            ),
          );
        },
      ),
    );
  }

  void isqOnboardingBlocListener(
      BuildContext context, IsqOnBoardingState state) {
    if (state.isqOnBoardingBackState ==
        IsqOnBoardingBackState.openConfirmation) {
      CustomInAppNotification.show(context, S.of(context).pressBackAgain,
          type: PopupType.grey);
    } else if (state.isqOnBoardingBackState ==
        IsqOnBoardingBackState.closeApp) {
      SystemNavigator.pop();
    }
  }

  bool isqOnboardingBlocListenWhen(
          IsqOnBoardingState previous, IsqOnBoardingState current) =>
      previous.isqOnBoardingBackState != current.isqOnBoardingBackState;

  static void open(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pushNamed(route);

  static void openAndRemoveAllRoute(BuildContext context) =>
      Navigator.of(context)
          .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
}
