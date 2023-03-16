import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../bloc/question/question_bloc.dart';
import '../ppi_result_screen.dart';
import '../ppi_screen.dart';

class PrivacyResultFailedScreen extends StatelessWidget {
  const PrivacyResultFailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<QuestionPageStep>(
      onBackPressed: () {
        context.read<QuestionBloc>().add(const CurrentPrivacyPageDecremented());
        context.read<NavigationBloc<QuestionPageStep>>().add(const PagePop());
      },
      header: const SizedBox.shrink(),
      child: PpiResultScreen(
        ppiResult: PpiResult.failed,
        memojiText: 'I’m afraid you’re not eligible for Asklora yet.',
        additionalMessage:
            'It could be your risk score is too low. If you made a mistake and did not answer the question correctly, please try again.',
        additionalMessageTextStyle: AskLoraTextStyles.body1,
        bottomPadding: 0,
        bottomButton: ButtonPair(
            primaryButtonOnClick: () => PpiScreen.open(context,
                arguments:
                    Pair(QuestionPageType.privacy, QuestionPageStep.privacy)),
            secondaryButtonOnClick: () {},
            primaryButtonLabel: 'TRY AGAIN',
            secondaryButtonLabel: 'MAYBE LATER'),
      ),
    );
  }
}
