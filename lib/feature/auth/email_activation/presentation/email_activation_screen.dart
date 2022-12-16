import 'package:flutter/material.dart';

import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../onboarding/ppi/presentation/investment_style_question/investment_style_welcome_screen.dart';

class EmailActivationScreen extends StatelessWidget {
  static const route = '/email_activation_screen';

  const EmailActivationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const LoraMemojiWidget(
              text: 'Check your email and activate your account.'),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonPair(
                primaryButtonLabel: 'RESEND ACTIVATION LINK',
                primaryButtonOnClick: () =>
                    InvestmentStyleWelcomeScreen.open(context),
                secondaryButtonOnClick: () => Navigator.pop(context),
                secondaryButtonLabel: 'SIGN UP AGAIN',
              )),
          // _test(context)
        ],
      ),
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
