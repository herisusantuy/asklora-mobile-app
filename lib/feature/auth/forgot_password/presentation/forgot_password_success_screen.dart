import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_text_new.dart';

class ForgotPasswordSuccessScreen extends StatelessWidget {
  const ForgotPasswordSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomScaffold(
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: 15),
          child: CustomTextNew(
            'Please enter your email. Instructions will be sent to reset your password.',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16),
          ),
        ),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const ForgotPasswordSuccessScreen(
            key: Key('forgot_password_success_screen'),
          ),
        ),
      );
}
