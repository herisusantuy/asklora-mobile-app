import 'package:flutter/material.dart';
import 'core/utils/token_checking.dart';
import 'feature/auth/sign_in/presentation/sign_in_success_screen.dart';
import 'home_screen.dart';

class App extends StatefulWidget {
  static const String route = '/app';

  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late TokenValidation tokenValidation;

  @override
  void initState() {
    tokenValidation = TokenValidation(
        onSuccess: () => SignInSuccessScreen.openAndRemoveAllRoute(context),
        onFailed: () => HomeScreen.openReplace(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        key: Key('progress_indicator'),
        child: CircularProgressIndicator(
          strokeWidth: 6,
        ),
      ),
    );
  }
}
