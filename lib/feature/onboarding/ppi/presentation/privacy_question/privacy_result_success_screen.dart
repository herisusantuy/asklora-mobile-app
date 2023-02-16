import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
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
        memojiText:
            "One year older, one year wiser, you know. \n \n Ok! Let's get to know more about you!",
        bottomButton: Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 35),
          child: PrimaryButton(
            key: const Key('next_button'),
            label: 'SURE!',
            onTap: () {
              context
                  .read<QuestionBloc>()
                  .add(const CurrentPersonalisationPageIncremented());
              context
                  .read<NavigationBloc<QuestionPageStep>>()
                  .add(const PageChanged(QuestionPageStep.personalisation));
            },
          ),
        ),
      ),
    );
  }
}
