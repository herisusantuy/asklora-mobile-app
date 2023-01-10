import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';

class CircularBotCard extends StatelessWidget {
  final String botName;

  const CircularBotCard(this.botName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: const BoxDecoration(
          shape: BoxShape.circle, color: AskLoraColors.lightGray),
      child: CustomTextNew(
        botName,
        style: AskLoraTextStyles.body2.copyWith(color: AskLoraColors.charcoal),
      ),
    );
  }
}
