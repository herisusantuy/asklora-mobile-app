import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/ai/utils/ai_utils.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../generated/l10n.dart';
import '../../../onboarding/ppi/presentation/investment_style_question/isq/bloc/isq_onboarding_bloc.dart';
import '../../../onboarding/ppi/presentation/investment_style_question/isq/presentation/ai_investment_style_question_onboarding_screen.dart';
import '../../../tabs/for_you/investment_style/presentation/ai_investment_style_question_for_you_screen.dart';
import '../../presentation/ai_welcome_screen.dart';
import '../../presentation/widgets/ai_welcome_subtitle_text.dart';

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
        create: (_) => IsqOnBoardingBloc(sharedPreference: SharedPreference()),
        child: BlocBuilder<IsqOnBoardingBloc, IsqOnBoardingState>(
            builder: (context, state) {
          return AiWelcomeScreen(
            enableBackgroundImage: isqType == ISQType.onboarding,
            aiThemeType: aiThemeType,
            title: S.of(context).timeForInvestmentStyleQuestion,
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: AiWelcomeSubtitleText(
                aiThemeType: aiThemeType,
                subTitle: S.of(context).isqWillHelpMeUnderstandWhatKindOfStocks,
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
          );
        }));
  }

  static void open(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pushNamed(route);
}
