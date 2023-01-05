import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';
import 'custom_text_new.dart';

class LoraMemojiWidget extends StatelessWidget {
  final String text;
  final Color textColor;

  const LoraMemojiWidget(
      {required this.text,
      Key? key = const Key('memoji_widget'),
      this.textColor = AskLoraColors.charcoal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Stack(alignment: Alignment.center, children: [
        SvgPicture.asset('assets/images/memoji_background_green.svg'),
        Image.asset('assets/images/memoji.png'),
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
