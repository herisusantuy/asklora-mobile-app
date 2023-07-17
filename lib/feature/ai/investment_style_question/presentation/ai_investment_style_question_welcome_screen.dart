import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../presentation/ai_welcome_screen.dart';
import '../../presentation/widgets/ai_welcome_subtitle_text.dart';

class AiInvestmentStyleQuestionWelcomeScreen extends StatelessWidget {
  static const String route = '/ai_investment_style_question_welcome_screen';

  const AiInvestmentStyleQuestionWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AiWelcomeScreen(
      title: S.of(context).aiIsqWelcomeTitle,
      child: Padding(
        padding: const EdgeInsets.only(top: 29),
        child: AiWelcomeSubtitleText(
          S.of(context).aiIsqWelcomeSubTitle,
        ),
      ),
      onBottomButtonTap: () {
        print('hello');
      },
    );
  }
}
