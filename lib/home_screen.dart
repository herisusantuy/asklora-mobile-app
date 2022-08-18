import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'core/presentation/custom_text_button.dart';
import 'core/utils/build_configs/build_config.dart';
import 'feature/auth/sign_in/presentation/sign_in_screen.dart';
import 'feature/auth/sign_up/presentation/sign_up_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/home';

  const HomeScreen({Key? key}) : super(key: key);

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
                  key: const Key('custom_button_sign_up'),
                  buttonText: 'Sign-Up',
                  onClick: () => SignUpScreen.open(context),
                  borderRadius: borderRadius,
                ),
                const Padding(padding: EdgeInsets.all(padding)),
                CustomTextButton(
                  key: const Key('custom_button_login'),
                  buttonText: 'Login',
                  onClick: () => SignInScreen.open(context),
                  borderRadius: borderRadius,
                ),
                Text('Test ${Environment().config.askLoraApiBaseUrl}'),
                TextButton(
                    onPressed: () => {throw Exception("Testing crash")},
                    child: const Text('Crash Me!!!'))
              ],
            )));
  }

  static void openReplace(BuildContext context) => Navigator.of(context)
      .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
}
