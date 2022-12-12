import 'package:flutter/material.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../kyc/presentation/kyc_screen.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../ppi_result_screen.dart';

class InvestmentStyleResultEndScreen extends StatelessWidget {
  const InvestmentStyleResultEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PpiResultScreen(
      mEmojiText: 'Your investment style is all set!',
      additionalMessage:
          'Let’s check your personalised recommendations. You are eligible for a FREE AI trade (US\$68.00). But first, you need to create an investment account.',
      bottomButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            _openInvestmentAccountButton(context),
            _maybeLaterButton(context)
          ],
        ),
      ),
    );
  }

  Widget _openInvestmentAccountButton(BuildContext context) => PrimaryButton(
        key: const Key('open_investment_account_button'),
        fontStyle: FontStyle.normal,
        label: 'OPEN INVESTMENT ACCOUNT',
        onTap: () => KycScreen.open(context),
      );

  Widget _maybeLaterButton(BuildContext context) => CustomTextButton(
        key: const Key('maybe_later_button'),
        margin: const EdgeInsets.only(top: 24),
        label: 'MAYBE LATER',
        onTap: () => CarouselScreen.open(context),
      );
}
