import 'package:flutter/material.dart';

import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../ppi_screen.dart';

class InvestmentStyleWelcomeScreen extends StatelessWidget {
  static const String route = '/investment_style_welcome_screen';

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
                      'Let’s dive into the core of the personalisation experience - defining your investment style.'),
            ),
            _defineInvestmentStyleButton(context),
            _signUpAgainButton(context)
          ],
        ),
      ),
    );
  }

  Widget _defineInvestmentStyleButton(BuildContext context) => PrimaryButton(
        key: const Key('define_investment_style_button'),
        fontStyle: FontStyle.normal,
        label: 'DEFINE INVESTMENT STYLE',
        onTap: () => PpiScreen.open(context,
            arguments: Pair(QuestionPageType.investmentStyle,
                QuestionPageStep.investmentStyle)),
      );

  Widget _signUpAgainButton(BuildContext context) => CustomTextButton(
        key: const Key('sign_up_again_button'),
        margin: const EdgeInsets.only(top: 24, bottom: 24),
        label: 'SIGN UP AGAIN',
        onTap: () => Navigator.pop(context),
      );

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
