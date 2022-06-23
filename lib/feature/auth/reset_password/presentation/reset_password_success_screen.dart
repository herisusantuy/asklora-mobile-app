import 'package:flutter/material.dart';

class ResetPasswordSuccesScreen extends StatelessWidget {
  const ResetPasswordSuccesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Reset Password'),
        ),
        body: const Center(
          child: Text('Reset password sent successfully.'),
        ),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const ResetPasswordSuccesScreen(
            key: Key('reset_password_success_screen'),
          ),
        ),
      );
}
