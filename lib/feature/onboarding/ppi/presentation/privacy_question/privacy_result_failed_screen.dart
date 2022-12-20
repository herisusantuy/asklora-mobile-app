import 'package:flutter/material.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../ppi_result_screen.dart';

class PrivacyResultFailedScreen extends StatelessWidget {
  const PrivacyResultFailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PpiResultScreen(
      memojiText:
          'I’m sorry, but….(explain the reason why they failed. e.g. too young)',
      additionalMessage: '-Reason-',
      bottomButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          children: [
            PrimaryButton(
              key: const Key('try_again_button'),
              label: 'TRY AGAIN',
              onTap: () => Navigator.pop(context),
            ),
            CustomTextButton(
              key: const Key('need_help_button'),
              margin: const EdgeInsets.only(top: 24),
              onTap: () {},
              label: 'NEED HELP?',
            )
          ],
        ),
      ),
    );
  }
}
