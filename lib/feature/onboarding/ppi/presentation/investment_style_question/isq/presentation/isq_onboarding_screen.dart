import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/domain/base_response.dart';
import '../../../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../../../core/utils/storage/shared_preference.dart';
import '../../../../../../ai/investment_style_question/presentation/ai_investment_style_question_welcome_screen.dart';
import '../bloc/isq_onboarding_bloc.dart';
import 'ai_investment_style_question_onboarding_screen.dart';

class IsqOnBoardingScreen extends StatelessWidget {
  static const route = '/isq_onboarding_screen';

  const IsqOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IsqOnBoardingBloc(
        sharedPreference: SharedPreference(),
      )..add(const GetAiWelcomeScreenStatus()),
      child: BlocBuilder<IsqOnBoardingBloc, IsqOnBoardingState>(
        builder: (context, state) {
          return CustomScaffold(
            enableBackNavigation: false,
            body: _getBody(state),
          );
        },
      ),
    );
  }

  Widget _getBody(IsqOnBoardingState state) {
    if (state.isqOnboardingResponseState == ResponseState.success) {
      if (state.aiWelcomeScreenStatus == true) {
        return const AiInvestmentStyleQuestionWelcomeScreen();
      } else {
        return const AiInvestmentStyleQuestionOnboardingScreen();
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
