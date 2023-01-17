import 'package:flutter/material.dart';

import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/circular_container.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_memoji_header.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../../utils/bot_stock_utils.dart';
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
          const LoraMemojiHeader(
              text:
                  'Bot does the work of buying and selling to execute your personalized strategy.'),
          _botCard(
              botType: BotType.pullUp,
              description: 'Try your luck for a bigger win'),
          _botCard(
              botType: BotType.plank,
              description: 'Stop loss and target gain automatically'),
          _botCard(
              botType: BotType.squat, description: 'Keen for passive income '),
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

  Widget _botCard({required BotType botType, required String description}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            CircularContainer(
                backgroundColor: botType.primaryBgColor,
                child: getSvgIcon(botType.botAssetName,
                    color: AskLoraColors.black  )),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextNew(
                    '${botType.name} BOT',
                    style: AskLoraTextStyles.h5Italic
                        .copyWith(color: AskLoraColors.charcoal),
                  ),
                  const SizedBox(
                    height: 5,
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
