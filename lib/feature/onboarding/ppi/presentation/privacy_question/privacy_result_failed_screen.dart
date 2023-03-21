import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../bloc/question/question_bloc.dart';
import '../ppi_result_screen.dart';
import '../ppi_screen.dart';

class PrivacyResultFailedScreen extends StatelessWidget {
  const PrivacyResultFailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: PpiResultScreen(
        ppiResult: PpiResult.failed,
        memojiText: 'I’m afraid you’re not eligible for Asklora yet.',
        additionalMessage:
            '\n\nIt could be your risk score is too low. If you made a mistake and did not answer the question correctly, please try again.',
        additionalMessageTextStyle: AskLoraTextStyles.subtitle1,
        bottomPadding: 0,
        bottomButton: ButtonPair(
            primaryButtonOnClick: () => PpiScreen.openReplace(context,
                arguments: const Pair(
                    QuestionPageType.privacy, QuestionPageStep.privacy)),
            secondaryButtonOnClick: openAskloraFaq,
            primaryButtonLabel: 'TRY AGAIN',
            secondaryButtonLabel: 'NEED HELP?'),
      ),
    );
  }

  void openAskloraFaq() async {
    const url = 'https://www.asklora.ai/faq';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
