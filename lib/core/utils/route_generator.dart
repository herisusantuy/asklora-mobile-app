import 'package:flutter/material.dart';

import '../../feature/auth/otp/presentation/otp_screen.dart';
import '../../feature/auth/sign_in/presentation/sign_in_screen.dart';
import '../../feature/auth/sign_in/presentation/sign_in_success_screen.dart';
import '../../feature/auth/sign_up/presentation/sign_up_screen.dart';
import '../../feature/auth/sign_up/presentation/sign_up_success_screen.dart';
import '../../feature/user/kyc/presentation/kyc_screen.dart';
import '../../home_screen.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case SignInScreen.route:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case SignInSuccessScreen.route:
        return MaterialPageRoute(builder: (_) => const SignInSuccessScreen());
      case SignUpScreen.route:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case SignUpSuccessScreen.route:
        return MaterialPageRoute(builder: (_) => const SignUpSuccessScreen());
      case OtpScreen.route:
        String email = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => OtpScreen(email: email));
      case KycScreen.route:
        return MaterialPageRoute(builder: (_) => const KycScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text(
                          'No route defined for ${settings.name}')) /*Container()*/,
                ));
    }
  }
}
