import 'package:flutter/material.dart';

import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/lora_popup_message/lora_popup_message.dart';
import '../../../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/sign_up/presentation/sign_up_screen.dart';
import '../../../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../../../onboarding/kyc/presentation/kyc_screen.dart';
import '../../../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../../../onboarding/ppi/presentation/ppi_screen.dart';
import '../../../../tabs/tabs_screen.dart';
import '../../gift/gift_bot_stock_welcome_screen.dart';
import '../UtilTest/portfolio_utils.dart';

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
        pngImage: loraPopUpMessageModel.loraMemojiType,
      ),
    );
  }

  LoraPopUpMessageModel _getBotPortfolioPopUpModel(
      BuildContext context, BotPortfolioPopUpType botPortfolioPopUpType) {
    switch (botPortfolioPopUpType) {
      case BotPortfolioPopUpType.createAccount:
        return LoraPopUpMessageModel(
            title: S.of(context).portfolioPopUpCreateAnAccountTitle,
            subTitle: S.of(context).portfolioPopUpCreateAnAccountSubTitle,
            primaryButtonLabel: S.of(context).createAnAccount,
            onPrimaryButtonTap: () => SignUpScreen.open(context));
      case BotPortfolioPopUpType.investmentStyle:
        return LoraPopUpMessageModel(
            title: S.of(context).portfolioPopUpDefineInvestmentTitle,
            subTitle: S.of(context).portfolioPopUpDefineInvestmentSubTitle,
            primaryButtonLabel: S.of(context).defineInvestmentStyle,
            onPrimaryButtonTap: () => PpiScreen.open(context,
                arguments: const Pair(QuestionPageType.investmentStyle,
                    QuestionPageStep.investmentStyle)));
      case BotPortfolioPopUpType.kyc:
        return LoraPopUpMessageModel(
            title: S.of(context).portfolioPopUpContinueAccountOpeningTitle,
            subTitle:
                S.of(context).portfolioPopUpContinueAccountOpeningSubTitle,
            primaryButtonLabel: S.of(context).continueAccountOpening,
            onPrimaryButtonTap: () => KycScreen.open(context));
      case BotPortfolioPopUpType.redeemBotStock:
        return LoraPopUpMessageModel(
            title: S.of(context).portfolioPopUpRedeemYourBotstockTitle,
            subTitle: S.of(context).portfolioPopUpRedeemYourBotstockSubTitle,
            primaryButtonLabel: S.of(context).redeemYourBotstockNow,
            onPrimaryButtonTap: () => GiftBotStockWelcomeScreen.open(context));
      case BotPortfolioPopUpType.noBotStock:
        return LoraPopUpMessageModel(
            title: S.of(context).portfolioPopUpNoTradingHasStartedTitle,
            subTitle: S.of(context).portfolioPopUpNoTradingHasStartedtSubTitle,
            primaryButtonLabel: S.of(context).startABotstock,
            onPrimaryButtonTap: () => TabsScreen.openAndRemoveAllRoute(context,
                initialTabScreenPage: TabScreenPage.forYou));
      case BotPortfolioPopUpType.deposit:
        return LoraPopUpMessageModel(
            title: S.of(context).portfolioPopUpFundAccountTitle,
            subTitle: S.of(context).portfolioPopUpFundAccountSubTitle,
            primaryButtonLabel: S.of(context).ok,
            onPrimaryButtonTap: () =>
                DepositWelcomeScreen.open(context: context));
      case BotPortfolioPopUpType.pendingReview:
        return LoraPopUpMessageModel(
          title: S.of(context).portfolioPopUpPendingReviewTitle,
          subTitle: S.of(context).portfolioPopUpPendingReviewSubTitle,
          loraMemojiType: 'lora_memoji_6',
        );
    }
  }
}
