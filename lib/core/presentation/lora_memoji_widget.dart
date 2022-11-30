import 'package:flutter/material.dart';

import 'custom_text.dart';

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
          padding: EdgeInsets.only(bottom: 32, top: 24),
        ),
        CustomText(
          text,
          type: FontType.h3W800,
          textAlign: TextAlign.center,
          padding: const EdgeInsets.symmetric(horizontal: 42),
        ),
      ],
    );
  }
}
