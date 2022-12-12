import 'package:flutter/material.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../onboarding/ppi/presentation/investment_style_question/investment_style_welcome_screen.dart';

class EmailActivationScreen extends StatelessWidget {
  static const route = '/email_activation_screen';

  const EmailActivationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.transparent(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const Expanded(
              child: LoraMemojiWidget(
                  text: 'Check your email and activate your account.',
                  imageAsset: '/'),
            ),
            _resendActivationLinkButton(context),
            _singUpAgainButton(context)
          ],
        ),
      ),
    );
  }

  Widget _resendActivationLinkButton(BuildContext context) => PrimaryButton(
        key: const Key('request_otp_button'),
        fontStyle: FontStyle.normal,
        label: 'RESEND ACTIVATION LINK',
        onTap: () => InvestmentStyleWelcomeScreen.open(context),
      );

  Widget _singUpAgainButton(BuildContext context) => CustomTextButton(
        key: const Key('sign_up_again_button'),
        margin: const EdgeInsets.only(top: 24, bottom: 24),
        label: 'SIGN UP AGAIN',
        onTap: () => Navigator.pop(context),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
