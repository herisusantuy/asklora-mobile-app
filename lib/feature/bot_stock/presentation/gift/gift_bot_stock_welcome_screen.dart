import 'package:flutter/material.dart';

import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_memoji_header.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../widgets/bot_stock_form.dart';
import 'bot_stock_explanation_screen.dart';

class GiftBotStockWelcomeScreen extends StatelessWidget {
  static const String route = '/gift_bot_stock_welcome_screen';

  const GiftBotStockWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotStockForm(
      backgroundColor: AskLoraColors.charcoal,
      content: Column(
        children: [
          const SafeArea(
            child: LoraMemojiHeader(
                textColor: AskLoraColors.white,
                text: 'Select a FREE AI trade now!'),
          ),
          CustomTextNew(
            'Ready? Select a FREE Botstock worths HKD500 based on your investment style that you set before.\n\nGo! Move Your A%\$',
            style: AskLoraTextStyles.body1.copyWith(color: AskLoraColors.white),
            textAlign: TextAlign.center,
          )
        ],
      ),
      bottomButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: PrimaryButton(
          buttonPrimaryType: ButtonPrimaryType.solidGreen,
          label: 'SURE! WHAT IS BOTSTOCK?',
          onTap: () => BotStockExplanationScreen.open(context),
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(
        context,
        route,
      );
}
