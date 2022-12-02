import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../ppi_result_screen.dart';

class InvestmentStyleResultEndScreen extends StatelessWidget {
  const InvestmentStyleResultEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PpiResultScreen(
      mEmojiText: 'Your investment style is all set!',
      additionalMessage:
          'Let check your personalised stock list, and start the FREE AI trade (US\$68) after create an investment account.',
      bottomButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          children: [
            _openInvestmentAccountButton(context),
            _maybeLaterButton(context)
          ],
        ),
      ),
    );
  }

  Widget _openInvestmentAccountButton(BuildContext context) => CustomButton(
        key: const Key('open_investment_account_button'),
        fontStyle: FontStyle.normal,
        label: 'OPEN INVESTMENT ACCOUNT',
        onClick: () {
          ///TODO MOVE TO KYC SCREEN MILESTONE 1.3
        },
      );

  Widget _maybeLaterButton(BuildContext context) => CustomTextButton(
        key: const Key('maybe_later_button'),
        margin: const EdgeInsets.only(top: 28, bottom: 28),
        label: 'MAYBE LATER',
        onTap: () => CarouselScreen.open(context),
      );
}
