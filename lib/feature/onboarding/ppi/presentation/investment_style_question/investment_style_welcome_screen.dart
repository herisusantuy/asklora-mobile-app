import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../onboarding/ppi/bloc/question/question_bloc.dart';

class InvestmentStyleWelcomeScreen extends StatelessWidget {
  const InvestmentStyleWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.transparent(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            const Expanded(
              child: LoraMemojiWidget(
                text:
                    'Let’s dive into the core of the personalisation experience, defining your investment style.',
                imageAsset: '/',
              ),
            ),
            _defineInvestmentStyleButton(context),
            _signUpAgainButton(context)
          ],
        ),
      ),
    );
  }

  Widget _defineInvestmentStyleButton(BuildContext context) => CustomButton(
        key: const Key('define_investment_style_button'),
        fontStyle: FontStyle.normal,
        label: 'DEFINE INVESTMENT STYLE',
        onClick: () {
          context.read<QuestionBloc>().add(const CurrentPageIncremented());
          context
              .read<NavigationBloc<QuestionPageStep>>()
              .add(const PageChanged(QuestionPageStep.investmentStyle));
        },
      );

  Widget _signUpAgainButton(BuildContext context) => CustomTextButton(
        key: const Key('sign_up_again_button'),
        margin: const EdgeInsets.only(top: 28, bottom: 28),
        label: 'SIGN UP AGAIN',
        onTap: () => Navigator.pop(context),
      );
}
