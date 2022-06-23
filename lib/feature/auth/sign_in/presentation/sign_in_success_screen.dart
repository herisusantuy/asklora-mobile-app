import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';

class SignInSuccessScreen extends StatelessWidget {
  const SignInSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Success Login'),
      ),
      body: const CustomText('Authentication Success'),
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const SignInSuccessScreen()));
}
