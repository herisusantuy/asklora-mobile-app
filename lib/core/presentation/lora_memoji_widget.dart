import 'package:flutter/material.dart';

import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';
import 'custom_text.dart';
import 'custom_text_new.dart';

class LoraMemojiWidget extends StatelessWidget {
  final String text;
  final String imageAsset;

  const LoraMemojiWidget(
      {required this.text,
      required this.imageAsset,
      Key? key = const Key('memoji_widget')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomText(
          '-MEmoji Image-',
          textAlign: TextAlign.center,
          color: AskLoraColors.charcoal,
          padding: EdgeInsets.only(bottom: 32, top: 24),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: CustomTextNew(
              text,
              style: AskLoraTextStyles.h4,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
