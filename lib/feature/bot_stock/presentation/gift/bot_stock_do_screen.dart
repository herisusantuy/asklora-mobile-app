import 'package:flutter/material.dart';

import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/buttons/secondary/extra_info_button.dart';
import '../../../../core/presentation/circular_container.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../generated/l10n.dart';
import '../../utils/bot_stock_utils.dart';
import '../bot_recommendation/free_bot_recommendation_screen.dart';
import '../widgets/bot_stock_form.dart';

class BotStockDoScreen extends StatelessWidget {
  static const String route = '/gift_bot_stock_do_screen';

  const BotStockDoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotStockForm(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          ExtraInfoButton(
            onTap: () => '',
            label: 'Lora\'s tips',
            buttonExtraInfoSize: ButtonExtraInfoSize.small,
          ),
          const SizedBox(height: 20),
          CustomTextNew(
            S.of(context).botStockDoScreenTitle,
            style: AskLoraTextStyles.h4,
          ),
          const SizedBox(height: 50),
          _botCard(
              botType: BotType.pullUp,
              description: S.of(context).botStockDoScreenPoint1),
          _botCard(
              botType: BotType.plank,
              description: S.of(context).botStockDoScreenPoint2),
          _botCard(
              botType: BotType.squat,
              description: S.of(context).botStockDoScreenPoint3),
        ],
      ),
      bottomButton: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30.0),
        child: PrimaryButton(
          label: S.of(context).understood,
          onTap: () => FreeBotRecommendationScreen.open(context),
        ),
      ),
    );
  }

  Widget _botCard({required BotType botType, required String description}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            CircularContainer(
                backgroundColor: botType.primaryBgColor,
                child: getSvgIcon(botType.botAssetName,
                    color: AskLoraColors.black)),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextNew(
                    '${botType.upperCaseName} BOT',
                    style: AskLoraTextStyles.h5
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
