import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../generated/l10n.dart';
import '../../../tabs/for_you/investment_style/presentation/ai_investment_style_question_for_you_screen.dart';
import '../../presentation/ai_welcome_screen.dart';
import '../../presentation/widgets/ai_welcome_subtitle_text.dart';
import '../../../onboarding/ppi/presentation/investment_style_question/ai_investment_style_question_onboarding_screen.dart';
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
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return AiWelcomeScreen(
          enableBackgroundImage: isqType == ISQType.onboarding,
          aiThemeType: aiThemeType,
          title: S.of(context).timeForInvestmentStyleQuestion,
          child: Padding(
            padding: const EdgeInsets.only(top: 48),
            child: AiWelcomeSubtitleText(
              aiThemeType: aiThemeType,
              subTitle: S.of(context).isqWillHelpMeUnderstandWhatKindOfStocks,
            ),
          ),
          onBottomButtonTap: () {
            if (isqType == ISQType.onboarding) {
              context
                  .read<AppBloc>()
                  .add(const UpdateAiWelcomeScreenStatus(false));
              AiInvestmentStyleQuestionOnboardingScreen.open(context);
            } else {
              AiInvestmentStyleQuestionForYouScreen.open(context,
                  aiThemeType: aiThemeType);
            }
          },
        );
      },
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pushNamed(route);
}
