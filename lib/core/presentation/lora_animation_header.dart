import 'package:flutter/material.dart';

import '../domain/pair.dart';
import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';
import '../utils/app_icons.dart';
import 'ai/lora_animation_green.dart';
import 'ai/lora_animation_magenta.dart';
import 'custom_text_new.dart';

enum LoraAnimationType { green, red }

class LoraAnimationHeader extends StatelessWidget {
  final String text;
  final Color textColor;
  final LoraAnimationType loraAnimationType;

  const LoraAnimationHeader({
    required this.text,
    this.loraAnimationType = LoraAnimationType.green,
    this.textColor = AskLoraColors.charcoal,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Stack(alignment: Alignment.center, children: [
        getSvgImage(_getHeaderProps().left),
        _getHeaderProps().right,
      ]),
      CustomTextNew(
        text,
        style: AskLoraTextStyles.h4.copyWith(color: textColor),
        textAlign: TextAlign.center,
      ),
    ]);
  }

  Pair<String, Widget> _getHeaderProps() {
    switch (loraAnimationType) {
      case LoraAnimationType.red:
        return const Pair('memoji_background_magenta', LoraAnimationGreen());
      default:
        return const Pair('memoji_background_magenta', LoraAnimationMagenta());
    }
  }
}
