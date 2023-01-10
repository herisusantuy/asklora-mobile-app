import 'package:flutter/material.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../widgets/gift_bot_stock_base_widget.dart';
import 'bot_stock_explanation_screen.dart';

class GiftBotStockWelcomeScreen extends StatelessWidget {
  static const String route = '/gift_bot_stock_welcome_screen';

  const GiftBotStockWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        useSafeArea: false,
        enableBackNavigation: false,
        backgroundColor: AskLoraColors.charcoal,
        body: GiftBotStockBaseWidget(
          content: Column(
            children: [
              const SafeArea(
                child: LoraMemojiWidget(
                    textColor: AskLoraColors.white,
                    text: 'Select a FREE AIs trade now!'),
              ),
              CustomTextNew(
                'Select a FREE Botstock worths USD\$68 based on your investment style that you set before.',
                style: AskLoraTextStyles.body1
                    .copyWith(color: AskLoraColors.white),
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
        ));
  }

  static void open(BuildContext context) => Navigator.pushNamed(
        context,
        route,
      );
}
