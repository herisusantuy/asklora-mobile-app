import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../auth/sign_up/presentation/sign_up_screen.dart';
import '../../bloc/question/question_bloc.dart';
import '../ppi_result_screen.dart';

class PersonalisationResultEndScreen extends StatelessWidget {
  const PersonalisationResultEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<QuestionPageStep>(
      onBackPressed: () {
        context.read<QuestionBloc>().add(const CurrentPersonalisationPageDecremented());
        context.read<NavigationBloc<QuestionPageStep>>().add(const PagePop());
      },
      header: const SizedBox.shrink(),
      child: PpiResultScreen(
        mEmojiText:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel nunc, egestas pulvinar sed ac semper porta.',
        additionalMessage:
            '(Screen that show some kind of a result to moviate user / user feel like they get a reward after answering the ques)',
        bottomButton: CustomButton(
          key: const Key('next_button'),
          label: 'GOT IT',
          onClick: () => SignUpScreen.open(context),
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        ),
      ),
    );
  }
}
