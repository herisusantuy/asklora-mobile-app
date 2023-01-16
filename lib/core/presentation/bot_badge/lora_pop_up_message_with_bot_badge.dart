import 'package:flutter/material.dart';

import '../../../feature/bot_stock/utils/bot_stock_utils.dart';
import '../../styles/asklora_colors.dart';
import '../../styles/asklora_text_styles.dart';
import '../../values/app_values.dart';
import '../buttons/primary_button.dart';
import '../custom_text_new.dart';
import '../lora_memoji_widget.dart';
import 'bot_badge.dart';

enum BadgePosition { top, belowSubtitle }

class LoraPopUpMessageWithBotBadge extends StatelessWidget {
  final String title;
  final String subTitle;
  final List<BotType> botTypes;
  final BadgePosition badgePosition;
  final bool withLoraImage;
  final Color backgroundColor;
  final Color titleColor;
  final Color subTitleColor;

  const LoraPopUpMessageWithBotBadge(
      {required this.title,
      required this.subTitle,
      required this.botTypes,
      this.withLoraImage = true,
      this.badgePosition = BadgePosition.belowSubtitle,
      this.backgroundColor = AskLoraColors.whiteSmoke,
      this.titleColor = AskLoraColors.charcoal,
      this.subTitleColor = AskLoraColors.charcoal,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: withLoraImage ? 70 : 0),
          child: IntrinsicHeight(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin: AppValues.screenHorizontalPadding,
                  width: double.infinity,
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: withLoraImage ? 64 : 32, bottom: 32),
                  width: double.infinity,
                  child: Column(
                    children: [
                      if (badgePosition == BadgePosition.top)
                        ...botTypes
                            .map((e) => BotBadge(
                                  botType: e,
                                ))
                            .toList(),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppValues.screenHorizontalPadding.left + 23,
                            right:
                                AppValues.screenHorizontalPadding.right + 23),
                        child: Column(
                          children: [
                            CustomTextNew(
                              title,
                              style: AskLoraTextStyles.h4
                                  .copyWith(color: titleColor),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomTextNew(
                              subTitle,
                              style: AskLoraTextStyles.body2
                                  .copyWith(color: subTitleColor),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      if (badgePosition == BadgePosition.belowSubtitle)
                        ...botTypes
                            .map((e) => BotBadge(
                                  botType: e,
                                ))
                            .toList(),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppValues.screenHorizontalPadding.left + 23,
                            right:
                                AppValues.screenHorizontalPadding.right + 23),
                        child: PrimaryButton(
                            buttonPrimaryType: ButtonPrimaryType.solidCharcoal,
                            label: 'CREATE AN ACCOUNT',
                            onTap: () {}),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (withLoraImage)
          const Align(
              alignment: Alignment.topCenter,
              child: LoraMemojiWidget(loraMemojiType: LoraMemojiType.lora1)),
      ],
    );
  }
}
