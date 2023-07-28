import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/presentation/ai/utils/ai_utils.dart';
import 'investment_style_result_end_screen.dart';
import '../../../../ai/investment_style_question/presentation/ai_investment_style_question_form.dart';

class AiInvestmentStyleQuestionOnboardingScreen extends StatelessWidget {
  static const String route = '/ai_investment_style_question_onboarding_screen';

  const AiInvestmentStyleQuestionOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) => AiInvestmentStyleQuestionForm(
        aiThemeType: AiThemeType.light,
        onFinished: () {
          context.read<AppBloc>().add(const SaveUserJourney(UserJourney.kyc));
          InvestmentStyleResultScreen.open(context);
        },
      );

  static void open(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pushNamed(route);
}
