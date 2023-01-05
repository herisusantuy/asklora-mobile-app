import 'package:flutter/material.dart';

import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../widgets/circular_bot_card.dart';
import '../widgets/gift_bot_stock_base_widget.dart';
import 'bot_stock_do_screen.dart';

class BotStockExplanationScreen extends StatelessWidget {
  static const String route = '/gift_bot_stock_explanation_screen';

  const BotStockExplanationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: GiftBotStockBaseWidget(
      content: Column(
        children: [
          const LoraMemojiWidget(
              text:
                  'A Botstock is a combination of a stock and a Bot. A Bot is where Lora  manages your stock position.'),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                  child: _botCard(
                      botName: 'Pull Up', description: 'Bot (AI investor)')),
              const Padding(
                padding: EdgeInsets.only(bottom: 24),
                child: Icon(
                  Icons.add,
                  color: AskLoraColors.gray,
                  size: 32,
                ),
              ),
              Expanded(child: _botCard(botName: 'TSLA', description: 'Stock')),
            ],
          )
        ],
      ),
      bottomButton: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: PrimaryButton(
          label: 'SURE! WHAT DOES BOT DO?',
          onTap: () => BotStockDoScreen.open(context),
        ),
      ),
    ));
  }

  Widget _botCard({required String botName, required String description}) =>
      Column(
        children: [
          CircularBotCard(botName),
          const SizedBox(
            height: 10,
          ),
          CustomTextNew(
            description,
            style: AskLoraTextStyles.h6.copyWith(color: AskLoraColors.charcoal),
          ),
        ],
      );

  static void open(BuildContext context) => Navigator.pushNamed(
        context,
        route,
      );
}
