import 'package:flutter/material.dart';

import '../../feature/auth/email_activation/presentation/email_activation_screen.dart';
import '../../feature/auth/otp/presentation/otp_screen.dart';
import '../../feature/auth/sign_in/presentation/sign_in_screen.dart';
import '../../feature/auth/sign_in/presentation/sign_in_success_screen.dart';
import '../../feature/auth/sign_up/presentation/sign_up_screen.dart';
import '../../feature/auth/sign_up/presentation/sign_up_success_screen.dart';
import '../../feature/onboarding/kyc/presentation/kyc_screen.dart';
import '../../feature/onboarding/ppi/bloc/question/question_bloc.dart';
import '../../feature/onboarding/ppi/presentation/investment_style_question/investment_style_welcome_screen.dart';
import '../../feature/onboarding/ppi/presentation/ppi_screen.dart';
import '../../feature/onboarding/welcome/ask_name/presentation/ask_name_screen.dart';
import '../../feature/onboarding/welcome/carousel/presentation/carousel_screen.dart';
import '../../feature/onboarding/welcome/greeting/greeting_screen.dart';
import '../../feature/orders/bloc/order_bloc.dart';
import '../../feature/orders/domain/symbol_detail.dart';
import '../../feature/orders/regular/presentation/regular_order_home_screen.dart';
import '../../feature/payment/deposits/presentation/deposit_screen.dart';
import '../../feature/payment/withdrawal/presentation/withdrawal_screen.dart';
import '../../feature/user/account/presentation/upgrade_account/not_eligible_screen.dart';
import '../../feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';

import '../../home_screen.dart';
import '../domain/pair.dart';
import '../presentation/photo_view_screen.dart';
import 'app_icons.dart';

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
      case UpgradeAccountScreen.route:
        return MaterialPageRoute(builder: (_) => UpgradeAccountScreen());
      case OtpScreen.route:
        String email = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => OtpScreen(email: email));
      case KycScreen.route:
        return MaterialPageRoute(builder: (_) => const KycScreen());
      case NotEligibleScreen.route:
        return MaterialPageRoute(builder: (_) => const NotEligibleScreen());
      case WithdrawalScreen.route:
        return MaterialPageRoute(builder: (_) => const WithdrawalScreen());
      case DepositScreen.route:
        return MaterialPageRoute(builder: (_) => const DepositScreen());
      case PhotoViewScreen.route:
        ImageProvider imageProvider = settings.arguments as ImageProvider;
        return MaterialPageRoute(
            builder: (_) => PhotoViewScreen(imageProvider));
      case RegularOrderHomeScreen.route:
        return MaterialPageRoute(
            builder: (_) => RegularOrderHomeScreen(
                availableBuyingPower: 1000,
                symbolDetail: SymbolDetail(
                    'AAPL.O', 100, AppIcons.appleLogo, SymbolType.symbol)));
      case PpiScreen.route:
        var args =
            settings.arguments as Pair<QuestionPageType, QuestionPageStep>;
        return MaterialPageRoute(
            builder: (_) => PpiScreen(
                  questionPageType: args.left,
                  initialQuestionPage: args.right,
                ));
      case CarouselScreen.route:
        return MaterialPageRoute(builder: (_) => const CarouselScreen());
      case AskNameScreen.route:
        return MaterialPageRoute(builder: (_) => const AskNameScreen());
      case GreetingScreen.route:
        return MaterialPageRoute(
            builder: (_) => GreetingScreen(name: settings.arguments as String));
      case EmailActivationScreen.route:
        return MaterialPageRoute(builder: (_) => const EmailActivationScreen());
      case InvestmentStyleWelcomeScreen.route:
        return MaterialPageRoute(
            builder: (_) => const InvestmentStyleWelcomeScreen());
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
