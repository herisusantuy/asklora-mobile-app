import 'package:flutter/material.dart';
import '../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../auth/sign_up/presentation/sign_up_screen.dart';
import '../ppi_result_screen.dart';

class PersonalisationResultEndScreen extends StatelessWidget {
  const PersonalisationResultEndScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PpiResultScreen(
      mEmojiText:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel nunc, egestas pulvinar sed ac semper porta.',
      additionalMessage: '(Screen that show some kind of a result to moviate user / user feel like they get a reward after answering the ques)',
      bottomButton: CustomButton(
        key: const Key('next_button'),
        label: 'GOT IT',
        onClick: ()=>SignUpScreen.open(context),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      ),
    );
  }
}
