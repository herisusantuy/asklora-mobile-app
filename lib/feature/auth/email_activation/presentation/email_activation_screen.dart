import 'package:flutter/material.dart';

import '../../../../core/domain/pair.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../../../core/presentation/we_create/custom_button.dart';
import '../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../../onboarding/ppi/presentation/ppi_screen.dart';

class EmailActivationScreen extends StatelessWidget {
  static const route = '/email_activation_screen';

  const EmailActivationScreen({Key? key}) : super(key: key);

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
                      'Let get started by activate the account by your provided email. ',
                  imageAsset: '/'),
            ),
            _resendActivationLinkButton(context),
            _singUpAgainButton(context)
          ],
        ),
      ),
    );
  }

  Widget _resendActivationLinkButton(BuildContext context) => CustomButton(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff232323),
        borderSide: const BorderSide(width: 2, color: Color(0xff232323)),
        key: const Key('request_otp_button'),
        fontStyle: FontStyle.normal,
        label: 'RESEND ACTIVATION LINK',
        onClick: () => PpiScreen.open(context,
            arguments: Pair(QuestionPageType.investmentStyle,
                QuestionPageStep.investmentStyleWelcome)),
      );

  Widget _singUpAgainButton(BuildContext context) => CustomTextButton(
        key: const Key('sign_up_again_button'),
        margin: const EdgeInsets.only(top: 28, bottom: 28),
        label: 'SIGN UP AGAIN',
        onTap: () => Navigator.pop(context),
        fontType: FontType.smallTextBold,
      );

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
