import 'package:flutter/material.dart';

import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/lora_memoji_header.dart';
import '../../../../core/values/app_values.dart';
import '../../../onboarding/ppi/presentation/investment_style_question/investment_style_welcome_screen.dart';

class EmailActivationScreen extends StatelessWidget {
  static const route = '/email_activation_screen';

  const EmailActivationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: AppValues.screenHorizontalPadding,
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LoraMemojiHeader(
                      text: 'Check your email and activate your account.'),
                  ButtonPair(
                      primaryButtonOnClick: () =>
                          InvestmentStyleWelcomeScreen.open(context),
                      secondaryButtonOnClick: () => Navigator.pop(context),
                      primaryButtonLabel: 'RESEND ACTIVATION LINK',
                      secondaryButtonLabel: 'SIGN UP AGAIN')
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
