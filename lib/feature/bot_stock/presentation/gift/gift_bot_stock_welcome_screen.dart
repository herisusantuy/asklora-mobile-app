import 'package:flutter/material.dart';

import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_animation_header.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/values/app_values.dart';
import '../../../../generated/l10n.dart';
import '../widgets/bot_stock_form.dart';
import 'bot_stock_do_screen.dart';

class GiftBotStockWelcomeScreen extends StatelessWidget {
  static const String route = '/gift_bot_stock_welcome_screen';

  const GiftBotStockWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: BotStockForm(
        enableBackNavigation: false,
        content: Container(
          width: screenSize.width,
          constraints: BoxConstraints(minHeight: screenSize.height / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LoraAnimationHeader(
                loraAnimationHeight: 208,
                loraAnimationWidth: 208,
              ),
              const SizedBox(height: 30),
              CustomTextNew(
                S.of(context).giftBotStockWelcomeScreenTitle,
                style: AskLoraTextStyles.h4,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        fixedBottomButton: Padding(
          padding:
              AppValues.screenHorizontalPadding.copyWith(bottom: 30, top: 10),
          child: PrimaryButton(
            buttonPrimaryType: ButtonPrimaryType.solidCharcoal,
            label: S.of(context).giftBotStockWelcomeScreenBottomButton,
            onTap: () => BotStockDoScreen.open(context),
          ),
        ),
      ),
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pushNamed(
        route,
      );
}
