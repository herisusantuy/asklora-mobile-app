import 'package:flutter/material.dart';

import '../domain/pair.dart';
import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';
import '../UtilTest/app_icons.dart';
import 'custom_text_new.dart';
import 'lora_memoji_widget.dart';

class LoraMemojiHeader extends StatelessWidget {
  final String text;
  final Color textColor;
  final LoraMemojiType loraMemojiType;

  const LoraMemojiHeader(
      {required this.text,
      this.loraMemojiType = LoraMemojiType.lora1,
      Key? key = const Key('memoji_widget'),
      this.textColor = AskLoraColors.charcoal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Stack(alignment: Alignment.center, children: [
        getSvgImage(_getMemojiProps().left),
        LoraMemojiWidget(loraMemojiType: _getMemojiProps().right),
      ]),
      Container(
          transform: Matrix4.translationValues(0, -35, 0),
          child: CustomTextNew(
            text,
            style: AskLoraTextStyles.h4.copyWith(color: textColor),
            textAlign: TextAlign.center,
          )),
    ]);
  }

  Pair<String, LoraMemojiType> _getMemojiProps() {
    switch (loraMemojiType) {
      case LoraMemojiType.lora6:
      case LoraMemojiType.lora8:
      case LoraMemojiType.lora9:
        return Pair('memoji_background_magenta', loraMemojiType);
      default:
        return Pair('memoji_background_green', loraMemojiType);
    }
  }
}
