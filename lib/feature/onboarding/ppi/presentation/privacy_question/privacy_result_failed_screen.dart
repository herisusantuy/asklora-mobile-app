import 'package:flutter/material.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
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
          padding: const EdgeInsets.only(top: 20),
          child: ButtonPair(
            primaryButtonOnClick: () => Navigator.pop(context),
            secondaryButtonOnClick: () {},
            primaryButtonLabel: 'TRY AGAIN',
            secondaryButtonLabel: 'NEED HELP?',
          )),
    );
  }
}
