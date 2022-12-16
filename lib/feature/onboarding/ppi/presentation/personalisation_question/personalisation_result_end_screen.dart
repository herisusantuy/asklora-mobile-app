import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../../auth/sign_up/presentation/sign_up_screen.dart';
import '../../bloc/question/question_bloc.dart';
import '../ppi_result_screen.dart';

class PersonalisationResultEndScreen extends StatelessWidget {
  const PersonalisationResultEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<QuestionPageStep>(
      onBackPressed: () {
        context
            .read<QuestionBloc>()
            .add(const CurrentPersonalisationPageDecremented());
        context.read<NavigationBloc<QuestionPageStep>>().add(const PagePop());
      },
      header: const SizedBox.shrink(),
      child: PpiResultScreen(
        memojiText: 'Do you know?',
        additionalMessage:
            '(Screen that show some kind of a result to movitiate user / user feel like they get a reward after answering the ques)',
        bottomButton: PrimaryButton(
          key: const Key('next_button'),
          label: 'GOT IT',
          onTap: () => SignUpScreen.open(context),
        ),
      ),
    );
  }
}
