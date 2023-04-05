import 'package:flutter/material.dart';

import '../../feature/auth/email_activation/presentation/email_activation_screen.dart';
import '../../feature/auth/otp/presentation/otp_screen.dart';
import '../../feature/auth/reset_password/presentation/reset_password_screen.dart';
import '../../feature/auth/sign_in/presentation/sign_in_screen.dart';
import '../../feature/auth/sign_up/presentation/sign_up_screen.dart';
import '../../feature/balance/deposit/presentation/deposit_result_screen.dart';
import '../../feature/balance/deposit/presentation/deposit_screen.dart';
import '../../feature/balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../feature/balance/deposit/utils/deposit_utils.dart';
import '../../feature/balance/withdrawal/presentation/withdrawal_amount/withdrawal_amount_screen.dart';
import '../../feature/balance/withdrawal/presentation/withdrawal_bank_detail_screen.dart';
import '../../feature/balance/withdrawal/presentation/withdrawal_result_screen.dart';
import '../../feature/balance/withdrawal/presentation/withdrawal_summary_screen.dart';
import '../../feature/bot_stock/domain/bot_recommendation_model.dart';
import '../../feature/bot_stock/presentation/bot_recommendation/bot_recommendation_screen.dart';
import '../../feature/bot_stock/presentation/bot_recommendation/detail/bot_recommendation_detail_screen.dart';
import '../../feature/bot_stock/presentation/bot_stock_result_screen.dart';
import '../../feature/bot_stock/presentation/bot_trade_summary/bot_trade_summary_screen.dart';
import '../../feature/bot_stock/presentation/gift/bot_stock_do_screen.dart';
import '../../feature/bot_stock/presentation/gift/bot_stock_explanation_screen.dart';
import '../../feature/bot_stock/presentation/gift/gift_bot_stock_welcome_screen.dart';
import '../../feature/bot_stock/presentation/portfolio/detail/bot_portfolio_detail_screen.dart';
import '../../feature/bot_stock/presentation/portfolio/domain/portfolio_bot_model.dart';
import '../../feature/bot_stock/presentation/portfolio/portfolio_screen.dart';
import '../../feature/bot_stock/utils/bot_stock_utils.dart';
import '../../feature/learning/learning_bot_stock_screen.dart';
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
import '../../feature/payment/withdrawal/presentation/withdrawal_screen.dart';
import '../../feature/settings/presentation/account_setting_screen.dart';
import '../../feature/settings/presentation/customer_service_screen.dart';
import '../../feature/settings/presentation/get_help_screen.dart';
import '../../feature/settings/presentation/settings_screen.dart';
import '../../feature/tabs/tabs_screen.dart';
import '../domain/pair.dart';
import '../presentation/custom_status_widget.dart';
import '../presentation/photo_view_screen.dart';
import 'app_icons.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignInScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignInScreen());
      case SignUpScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SignUpScreen());
      case OtpScreen.route:
        var arguments = settings.arguments as Pair<String, String>;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) =>
                OtpScreen(email: arguments.left, password: arguments.right));
      case KycScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const KycScreen());
      case WithdrawalScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const WithdrawalScreen());
      case DepositScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => DepositScreen(
                  depositType: settings.arguments as DepositType,
                ));
      case PhotoViewScreen.route:
        ImageProvider imageProvider = settings.arguments as ImageProvider;
        return MaterialPageRoute(
            settings: settings, builder: (_) => PhotoViewScreen(imageProvider));
      case RegularOrderHomeScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => RegularOrderHomeScreen(
                availableBuyingPower: 1000,
                symbolDetail: SymbolDetail(
                    'AAPL.O', 100, AppIcons.appleLogo, SymbolType.symbol)));
      case PpiScreen.route:
        var args =
            settings.arguments as Pair<QuestionPageType, QuestionPageStep>;
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => PpiScreen(
                  questionPageType: args.left,
                  initialQuestionPage: args.right,
                ));
      case CarouselScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const CarouselScreen());
      case AskNameScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const AskNameScreen());
      case GreetingScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => GreetingScreen(name: settings.arguments as String));
      case EmailActivationScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) =>
                EmailActivationScreen(userName: settings.arguments as String));
      case ResetPasswordScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => ResetPasswordScreen(
                resetPasswordToken: settings.arguments as String));
      case InvestmentStyleWelcomeScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const InvestmentStyleWelcomeScreen());
      case GiftBotStockWelcomeScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const GiftBotStockWelcomeScreen());
      case BotStockExplanationScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const BotStockExplanationScreen());
      case BotStockDoScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const BotStockDoScreen());
      case BotRecommendationScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const BotRecommendationScreen());
      case BotRecommendationDetailScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => BotRecommendationDetailScreen(
                  botRecommendationModel:
                      settings.arguments as BotRecommendationModel,
                ));
      case BotPortfolioDetailScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => BotPortfolioDetailScreen(
                  portfolioBotModel: settings.arguments as PortfolioBotModel,
                ));
      case BotTradeSummaryScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => BotTradeSummaryScreen(
                  botTradeSummaryModel:
                      settings.arguments as BotTradeSummaryModel,
                ));
      case PortfolioScreen.route:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const PortfolioScreen());
      case DepositWelcomeScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => DepositWelcomeScreen(
                  initialDepositType: settings.arguments as DepositType?,
                ));
      case DepositResultScreen.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) {
              var arguments =
                  settings.arguments as Pair<DepositType, StatusType>;
              return DepositResultScreen(
                statusType: arguments.right,
                depositType: arguments.left,
              );
            });
      case TabsScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => TabsScreen(
            initialTabScreenPage: settings.arguments as TabScreenPage?,
          ),
        );
      case WithdrawalBankDetailScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const WithdrawalBankDetailScreen(),
        );
      case WithdrawalAmountScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const WithdrawalAmountScreen(),
        );
      case WithdrawalSummaryScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => WithdrawalSummaryScreen(
            withdrawalAmount: settings.arguments as double,
          ),
        );
      case WithdrawalResultScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const WithdrawalResultScreen(),
        );
      case LearningBotStockScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LearningBotStockScreen(
            botType: settings.arguments as BotType,
          ),
        );
      case BotStockResultScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BotStockResultScreen(
            arguments: settings.arguments as Pair<String, String>,
          ),
        );
      case SettingsScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SettingsScreen(),
        );
      case GetHelpScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const GetHelpScreen(),
        );
      case CustomerServiceScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CustomerServiceScreen(),
        );
      case AccountSettingScreen.route:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AccountSettingScreen(),
        );
      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text(
                          'No route defined for ${settings.name}')) /*Container()*/,
                ));
    }
  }
}
