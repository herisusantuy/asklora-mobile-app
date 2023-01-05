import 'package:flutter/material.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../bot_recommendation/bot_recommendation_screen.dart';
import '../widgets/circular_bot_card.dart';
import '../widgets/gift_bot_stock_base_widget.dart';

class BotStockDoScreen extends StatelessWidget {
  static const String route = '/gift_bot_stock_do_screen';

  const BotStockDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: GiftBotStockBaseWidget(
      content: Column(
        children: [
          const LoraMemojiWidget(
              text:
                  'Bot does the work of buying and selling to execute your personalized strategy.'),
          _botCard(
              botName: 'PULLUP', description: 'Try your luck for a bigger win'),
          _botCard(
              botName: 'PLANK',
              description: 'Stop loss and target gain automatically'),
          _botCard(botName: 'SQUAT', description: 'Keen for passive income '),
        ],
      ),
      bottomButton: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30.0),
        child: PrimaryButton(
          label: 'SEE MY RECOMMENDATIONS',
          onTap: () => BotRecommendationScreen.open(context),
        ),
      ),
    ));
  }

  Widget _botCard({required String botName, required String description}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            CircularBotCard(botName),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextNew(
                    '$botName BOT',
                    style: AskLoraTextStyles.h5
                        .copyWith(color: AskLoraColors.charcoal),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  CustomTextNew(
                    description,
                    style: AskLoraTextStyles.body1
                        .copyWith(color: AskLoraColors.charcoal),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  static void open(BuildContext context) => Navigator.pushNamed(
        context,
        route,
      );
}
