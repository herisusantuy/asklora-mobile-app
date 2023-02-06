import 'package:flutter/material.dart';

import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/lora_popup_message.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../auth/sign_up/presentation/sign_up_screen.dart';
import '../../../../onboarding/kyc/presentation/kyc_screen.dart';
import '../../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../../../onboarding/ppi/presentation/ppi_screen.dart';
import '../../gift/gift_bot_stock_welcome_screen.dart';
import '../domain/bot_portfolio_pop_up_model.dart';

class BotPortfolioPopUp extends StatelessWidget {
  final BotPortfolioPopUpType botPortfolioPopUpType;

  const BotPortfolioPopUp({required this.botPortfolioPopUpType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BotPortfolioPopUpModel botPortfolioPopUpModel =
        _getBotPortfolioPopUpModel(context, botPortfolioPopUpType);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: LoraPopUpMessage(
        backgroundColor: AskLoraColors.charcoal,
        title: botPortfolioPopUpModel.title,
        titleColor: AskLoraColors.white,
        subTitle: botPortfolioPopUpModel.subTitle,
        subTitleColor: AskLoraColors.white,
        buttonLabel: botPortfolioPopUpModel.buttonLabel,
        onPrimaryButtonTap: botPortfolioPopUpModel.onTap,
        buttonPrimaryType: ButtonPrimaryType.solidGreen,
      ),
    );
  }

  BotPortfolioPopUpModel _getBotPortfolioPopUpModel(
      BuildContext context, BotPortfolioPopUpType botPortfolioPopUpType) {
    switch (botPortfolioPopUpType) {
      case BotPortfolioPopUpType.createAccount:
        return BotPortfolioPopUpModel(
            title: 'Create an Account and Start Trading!',
            subTitle:
                'You can manage all your investments here after you start trading. Create an account and start trading.',
            buttonLabel: 'CREATE AN ACCOUNT',
            onTap: () => SignUpScreen.open(context));
      case BotPortfolioPopUpType.investmentStyle:
        return BotPortfolioPopUpModel(
            title: 'Define Your Investment Style',
            subTitle:
                'Looks like you haven’t defined your Investment Style yet. Let’s go and see what kind of Botstocks suit you best!',
            buttonLabel: 'DEFINE INVESTMENT STYLE',
            onTap: () => PpiScreen.open(context,
                arguments: Pair(QuestionPageType.investmentStyle,
                    QuestionPageStep.investmentStyle)));
      case BotPortfolioPopUpType.kyc:
        return BotPortfolioPopUpModel(
            title: 'Continue Account Opening',
            subTitle:
                'You still need to complete your account opening until you can start trading.',
            buttonLabel: 'CONTINUE ACCOUNT OPENING',
            onTap: () => KycScreen.open(context));
      case BotPortfolioPopUpType.redeemBotStock:
        return BotPortfolioPopUpModel(
            title: 'Redeem Your Free Botstock',
            subTitle:
                'Looks like you haven’t claimed your free Botstock yet. Let’s get trading right away!',
            buttonLabel: 'REDEEM YOUR BOTSTOCK NOW',
            onTap: () => GiftBotStockWelcomeScreen.open(context));
      case BotPortfolioPopUpType.noBotStock:
        return BotPortfolioPopUpModel(
            title: 'No trading has started!',
            subTitle:
                'You can manage all your investments here after you start trading. ',
            buttonLabel: 'START A BOTSTOCK',
            onTap: () => SignUpScreen.open(context));
    }
  }
}
