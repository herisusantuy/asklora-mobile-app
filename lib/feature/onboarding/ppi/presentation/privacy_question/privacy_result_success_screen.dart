import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../../../core/presentation/we_create/custom_button.dart';
import '../../bloc/question/question_bloc.dart';
import '../ppi_result_screen.dart';

class PrivacyResultSuccessScreen extends StatelessWidget {
  const PrivacyResultSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<QuestionPageStep>(
      onBackPressed: () {
        context.read<QuestionBloc>().add(const CurrentPrivacyPageDecremented());
        context.read<NavigationBloc<QuestionPageStep>>().add(const PagePop());
      },
      header: const SizedBox.shrink(),
      child: PpiResultScreen(
        mEmojiText:
            'Thank you for your trust. Unfortunately my age is a secret...',
        additionalMessage: 'Let’s talk about your personality.',
        bottomButton: CustomButton(
          key: const Key('next_button'),
          label: 'SURE!',
          onClick: () {
            context
                .read<QuestionBloc>()
                .add(const CurrentPersonalisationPageIncremented());
            context
                .read<NavigationBloc<QuestionPageStep>>()
                .add(const PageChanged(QuestionPageStep.personalisation));
          },
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        ),
      ),
    );
  }
}
