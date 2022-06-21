import 'package:flutter/material.dart';

import 'core/presentation/custom_text_button.dart';
import 'feature/auth/sign_up/presentation/sign_up_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }

  static void open(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = 32.0;
    const padding = 15.0;

    return Scaffold(
        appBar: AppBar(
          title: const Text('AskLora'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextButton(
                  buttonText: 'Sign-Up',
                  onClick: () => {SignUpScreen.open(context)},
                  borderRadius: borderRadius,
                ),
                const Padding(padding: EdgeInsets.all(padding)),
                CustomTextButton(
                  buttonText: 'Login',
                  onClick: () => {SignUpScreen.open(context)},
                  borderRadius: borderRadius,
                ),
              ],
            )));
  }
}
