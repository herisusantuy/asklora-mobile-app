import 'package:flutter/material.dart';

class ForgotPasswordSuccessScreen extends StatelessWidget {
  const ForgotPasswordSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password'),
        ),
        body: const Center(
          child: Text('Forgot password sent successfully.'),
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
