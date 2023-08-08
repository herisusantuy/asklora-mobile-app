import 'package:flutter/material.dart';

import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_animation_header.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/bot_stock_form.dart';
import 'bot_stock_do_screen.dart';

class GiftBotStockWelcomeScreen extends StatelessWidget {
  static const String route = '/gift_bot_stock_welcome_screen';

  const GiftBotStockWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BotStockForm(
        enableBackNavigation: false,
        content: Column(
          children: [
            const LoraAnimationHeader(
              loraAnimationHeight: 208,
              loraAnimationWidth: 208,
            ),
            const SizedBox(height: 100),
            CustomTextNew(
              S.of(context).giftBotStockWelcomeScreenTitle,
              style: AskLoraTextStyles.h4,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        bottomButton: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
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
