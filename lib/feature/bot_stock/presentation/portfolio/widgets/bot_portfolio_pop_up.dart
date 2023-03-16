import 'package:flutter/material.dart';

import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/lora_popup_message/lora_popup_message.dart';
import '../../../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../auth/sign_up/presentation/sign_up_screen.dart';
import '../../../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../../../onboarding/kyc/presentation/kyc_screen.dart';
import '../../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../../../onboarding/ppi/presentation/ppi_screen.dart';
import '../../../../tabs/tabs_screen.dart';
import '../../gift/gift_bot_stock_welcome_screen.dart';
import '../utils/portfolio_enum.dart';

class BotPortfolioPopUp extends StatelessWidget {
  final BotPortfolioPopUpType botPortfolioPopUpType;

  const BotPortfolioPopUp({required this.botPortfolioPopUpType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoraPopUpMessageModel loraPopUpMessageModel =
        _getBotPortfolioPopUpModel(context, botPortfolioPopUpType);

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: LoraPopUpMessage(
        backgroundColor: AskLoraColors.charcoal,
        title: loraPopUpMessageModel.title,
        titleColor: AskLoraColors.white,
        subTitle: loraPopUpMessageModel.subTitle,
        subTitleColor: AskLoraColors.white,
        primaryButtonLabel: loraPopUpMessageModel.primaryButtonLabel,
        onPrimaryButtonTap: loraPopUpMessageModel.onPrimaryButtonTap,
        buttonPrimaryType: ButtonPrimaryType.solidGreen,
      ),
    );
  }

  LoraPopUpMessageModel _getBotPortfolioPopUpModel(
      BuildContext context, BotPortfolioPopUpType botPortfolioPopUpType) {
    switch (botPortfolioPopUpType) {
      case BotPortfolioPopUpType.createAccount:
        return LoraPopUpMessageModel(
            title: 'Create an Account and Start Trading!',
            subTitle:
                'You can manage all your investments here after you start trading. Create an account and start trading.',
            primaryButtonLabel: 'CREATE AN ACCOUNT',
            onPrimaryButtonTap: () => SignUpScreen.open(context));
      case BotPortfolioPopUpType.investmentStyle:
        return LoraPopUpMessageModel(
            title: 'Define Your Investment Style',
            subTitle:
                'Looks like you haven’t defined your Investment Style yet. Let’s go and see what kind of Botstocks suit you best!',
            primaryButtonLabel: 'DEFINE INVESTMENT STYLE',
            onPrimaryButtonTap: () => PpiScreen.open(context,
                arguments: const Pair(QuestionPageType.investmentStyle,
                    QuestionPageStep.investmentStyle)));
      case BotPortfolioPopUpType.kyc:
        return LoraPopUpMessageModel(
            title: 'Continue Account Opening',
            subTitle:
                'You still need to complete your account opening until you can start trading.',
            primaryButtonLabel: 'CONTINUE ACCOUNT OPENING',
            onPrimaryButtonTap: () => KycScreen.open(context));
      case BotPortfolioPopUpType.redeemBotStock:
        return LoraPopUpMessageModel(
            title: 'Redeem Your Free Botstock',
            subTitle:
                'Looks like you haven’t claimed your free Botstock yet. Let’s get trading right away!',
            primaryButtonLabel: 'REDEEM YOUR BOTSTOCK NOW',
            onPrimaryButtonTap: () => GiftBotStockWelcomeScreen.open(context));
      case BotPortfolioPopUpType.noBotStock:
        return LoraPopUpMessageModel(
            title: 'No trading has started!',
            subTitle:
                'You can manage all your investments here after you start trading. ',
            primaryButtonLabel: 'START A BOTSTOCK',
            onPrimaryButtonTap: () => TabsScreen.openAndRemoveAllRoute(context,
                initialTabScreenPage: TabScreenPage.forYou));
      case BotPortfolioPopUpType.deposit:
        return LoraPopUpMessageModel(
            title: 'Fund your account',
            subTitle:
                'Looks like you haven’t funded your account yet. Deposit HKD 10,000 to activate your account.',
            primaryButtonLabel: 'OK!',
            onPrimaryButtonTap: () =>
                DepositWelcomeScreen.open(context: context));
    }
  }
}
