import 'package:flutter/material.dart';

class SignUpSuccessScreen extends StatelessWidget {
  const SignUpSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Sign-up Success')),
        body: const Text('TO DO Screen'),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const SignUpSuccessScreen()));
}
