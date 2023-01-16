import 'package:flutter/material.dart';

import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';
import '../utils/app_icons.dart';
import 'custom_text_new.dart';
import 'lora_memoji_widget.dart';

class LoraMemojiHeader extends StatelessWidget {
  final String text;
  final Color textColor;

  const LoraMemojiHeader(
      {required this.text,
      Key? key = const Key('memoji_widget'),
      this.textColor = AskLoraColors.charcoal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Stack(alignment: Alignment.center, children: [
        getSvgImage('memoji_background_green'),
        const LoraMemojiWidget(loraMemojiType: LoraMemojiType.lora1),
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
}
