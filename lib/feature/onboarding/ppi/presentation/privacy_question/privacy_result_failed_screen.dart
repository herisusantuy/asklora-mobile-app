import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/domain/endpoints.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/UtilTest/UtilTest.dart';
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
            '\nIt could be that your risk score or age is too low.\n\nIf you made a mistake and did not answer the questions correctly, please try again',
        additionalMessageTextStyle: AskLoraTextStyles.subtitle1,
        bottomPadding: 0,
        bottomButton: ButtonPair(
            primaryButtonOnClick: () => PpiScreen.openReplace(context,
                arguments: const Pair(
                    QuestionPageType.privacy, QuestionPageStep.privacy)),
            secondaryButtonOnClick: () =>
                openUrl(askloraFaq, mode: LaunchMode.externalApplication),
            primaryButtonLabel: 'TRY AGAIN',
            secondaryButtonLabel: 'NEED HELP?'),
      ),
    );
  }
}
