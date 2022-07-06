import 'package:flutter/material.dart';
import 'app.dart';
import 'core/presentation/custom_text_button.dart';
import 'core/utils/route_generator.dart';
import 'feature/auth/sign_in/presentation/sign_in_screen.dart';
import 'feature/auth/sign_up/presentation/sign_up_screen.dart';

class AskLora extends StatelessWidget {
  const AskLora({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouterGenerator.generateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: App.route,
    );
  }
}

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
              ],
            )));
  }

  static void openReplace(BuildContext context) =>
      Navigator.of(context).pushReplacementNamed(route);
}
