import 'package:flutter/material.dart';
import '../../feature/auth/otp/presentation/otp_screen.dart';
import '../../feature/auth/sign_in/presentation/sign_in_screen.dart';
import '../../feature/auth/sign_up/presentation/sign_up_screen.dart';
import '../../feature/user/kyc/presentation/kyc_screen.dart';
import '../../home_screen.dart';

const String homeRoute = '/home';
const String signInRoute = '/sign_in';
const String signUpRoute = '/sign_up';
const String otpRoute = '/otp';
const String kycRoute = '/kyc';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case signInRoute:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case otpRoute:
        String email = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => OtpScreen(email: email));
      case kycRoute:
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
