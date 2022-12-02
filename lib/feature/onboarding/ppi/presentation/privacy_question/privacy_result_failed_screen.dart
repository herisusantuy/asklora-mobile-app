import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../ppi_result_screen.dart';

class PrivacyResultFailedScreen extends StatelessWidget {
  const PrivacyResultFailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PpiResultScreen(
      mEmojiText:
          'I’m sorry, but….(explain the reason why they failed. e.g. too young)',
      additionalMessage: '-Reason-',
      bottomButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          children: [
            CustomButton(
              key: const Key('try_again_button'),
              label: 'TRY AGAIN',
              onClick: () => Navigator.pop(context),
              margin: const EdgeInsets.only(bottom: 32),
            ),
            CustomTextButton(
              key: const Key('need_help_button'),
              margin: const EdgeInsets.only(bottom: 16),
              onTap: () {},
              label: 'NEED HELP?',
            )
          ],
        ),
      ),
    );
  }
}
