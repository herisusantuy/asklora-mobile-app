import 'package:flutter/material.dart';

import 'core/presentation/bot_badge/lora_pop_up_message_with_bot_badge.dart';
import 'core/presentation/buttons/button_example.dart';
import 'core/presentation/text_fields/text_field_example.dart';
import 'core/styles/asklora_colors.dart';
import 'feature/bot_stock/domain/bot_recommendation_model.dart';
import 'feature/bot_stock/utils/bot_stock_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asklora Testing',
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          children: [
            LoraPopUpMessageWithBotBadge(
              backgroundColor: AskLoraColors.primaryGreen,
              badgePosition: BadgePosition.belowSubtitle,
              title: 'No traded BotStocks.',
              subTitle:
                  'You can manage all your investments here after you start trading. Create an account and start trading.',
              botTypes: const [BotType.pullUp, BotType.squat],
              botRecommendationModel: const BotRecommendationModel(
                  38659,
                  'CLASSIC_classic_003846',
                  null,
                  'CLASSIC',
                  'Plank',
                  'WTW.O',
                  'WILLIS TOWERS WATSON PLC',
                  'WTW',
                  '213.16',
                  '2023-08-03T05:44:13.098144',
                  '2023-08-03T05:44:13.098148',
                  '2 Weeks'),
              buttonLabel: 'NEXT',
              onButtonTap: () {},
            ),
            const ButtonExample(),
            const SizedBox(
              height: 24,
            ),
            const TextFieldExample()
          ],
        ),
      ));
}
