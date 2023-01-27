import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/presentation/buttons/primary_button.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/lora_popup_message.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../core/values/app_values.dart';
import '../../bot_stock/presentation/bot_recommendation/bot_recommendation_screen.dart';
import '../../bot_stock/utils/bot_stock_utils.dart';

class ForYouScreenForm extends StatelessWidget {
  const ForYouScreenForm({super.key});

  final double _spacing = 16;
  final double botCardHeight = 165;
  final double blurPadding = 8;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: false,
      backgroundColor: AskLoraColors.white,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
                padding: AppValues.screenHorizontalPadding,
                child: CustomTextNew(
                  'Investments for you, by you',
                  style: AskLoraTextStyles.h2
                      .copyWith(color: AskLoraColors.charcoal),
                )),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: blurPadding),
                  padding: AppValues.screenHorizontalPadding
                      .copyWith(top: blurPadding, bottom: blurPadding),
                  child: Wrap(
                    spacing: _spacing,
                    runSpacing: _spacing,
                    children: defaultRecommendedBots
                        .map((e) => BotRecommendationCard(
                              onTap: () {},
                              height: botCardHeight,
                              recommendedBot: e,
                              spacing: _spacing,
                            ))
                        .toList(),
                  ),
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ),
                const Padding(
                  padding: AppValues.screenHorizontalPadding,
                  child: LoraPopUpMessage(
                    backgroundColor: AskLoraColors.charcoal,
                    title: 'No Botstock recommendation.',
                    titleColor: AskLoraColors.white,
                    subTitle:
                        'I will recommend up to 20 Botstocks that created just for you after you define investment style and open the investment account.',
                    subTitleColor: AskLoraColors.white,
                    buttonLabel: 'CREATE AN ACCOUNT',
                    buttonPrimaryType: ButtonPrimaryType.solidGreen,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
