import 'package:flutter/material.dart';

class ResetPasswordSuccesScreen extends StatelessWidget {
  const ResetPasswordSuccesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Reset password Success'),
        ),
        body: const Text('Reset password.'),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const ResetPasswordSuccesScreen(),
        ),
      );
}
