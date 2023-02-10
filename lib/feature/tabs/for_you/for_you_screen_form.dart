import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc/app_bloc.dart';
import '../../../core/domain/pair.dart';
import '../../../core/presentation/bot_stock_background_with_pop_up.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/lora_popup_message/model/lora_pop_up_message_model.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../auth/sign_up/presentation/sign_up_screen.dart';
import '../../bot_stock/presentation/bot_recommendation/bot_recommendation_screen.dart';
import '../../bot_stock/presentation/gift/gift_bot_stock_welcome_screen.dart';
import '../../onboarding/kyc/presentation/kyc_screen.dart';
import '../../onboarding/ppi/bloc/question/question_bloc.dart';
import '../../onboarding/ppi/presentation/ppi_screen.dart';

class ForYouScreenForm extends StatelessWidget {
  const ForYouScreenForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
            previous.userJourney != current.userJourney,
        builder: (context, state) {
          if (state.userJourney == UserJourney.personalisation ||
              state.userJourney == UserJourney.createAccount ||
              state.userJourney == UserJourney.investmentStyle ||
              state.userJourney == UserJourney.kyc ||
              state.userJourney == UserJourney.freeBotStock) {
            final LoraPopUpMessageModel loraPopUpMessageModel =
                _getLoraPopUpMessageModel(context, state.userJourney);
            return BotStockBackgroundWithPopUp(
                shouldScrollable: false,
                header: CustomTextNew(
                  'Investments for you, by you',
                  style: AskLoraTextStyles.h2
                      .copyWith(color: AskLoraColors.charcoal),
                ),
                popUpTitle: loraPopUpMessageModel.title,
                popUpSubTitle: loraPopUpMessageModel.subTitle,
                popUpButtonLabel: loraPopUpMessageModel.buttonLabel,
                onPopUpButtonTap: loraPopUpMessageModel.onTap);
          } else {
            return const BotRecommendationScreen();
          }
        });
  }

  LoraPopUpMessageModel _getLoraPopUpMessageModel(
      BuildContext context, UserJourney userJourney) {
    switch (userJourney) {
      case UserJourney.personalisation:
        return LoraPopUpMessageModel(
            title: 'No Botstock recommendation.',
            subTitle:
                'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
            buttonLabel: 'ANSWER PERSONALISATION QUESTIONS',
            onTap: () => SignUpScreen.open(context));
      case UserJourney.createAccount:
        return LoraPopUpMessageModel(
            title: 'No Botstock recommendation.',
            subTitle:
                'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
            buttonLabel: 'CREATE AN ACCOUNT',
            onTap: () => SignUpScreen.open(context));
      case UserJourney.investmentStyle:
        return LoraPopUpMessageModel(
            title: 'No Botstock recommendation.',
            subTitle:
                'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
            buttonLabel: 'DEFINE INVESTMENT STYLE',
            onTap: () => PpiScreen.open(context,
                arguments: Pair(QuestionPageType.investmentStyle,
                    QuestionPageStep.investmentStyle)));
      case UserJourney.kyc:
        return LoraPopUpMessageModel(
            title: 'No Botstock recommendation.',
            subTitle:
                'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
            buttonLabel: 'OPEN INVESTMENT ACCOUNT',
            onTap: () => KycScreen.open(context));
      default:
        return LoraPopUpMessageModel(
            title: 'No Botstock recommendation.',
            subTitle:
                'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
            buttonLabel: 'REDEEM YOUR BOTSTOCK NOW',
            onTap: () => GiftBotStockWelcomeScreen.open(context));
    }
  }
}
