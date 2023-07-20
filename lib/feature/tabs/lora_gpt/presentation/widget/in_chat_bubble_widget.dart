import 'package:flutter/material.dart';

import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';

class InChatBubbleWidget extends StatelessWidget {
  const InChatBubbleWidget(
      {required this.message, required this.name, super.key});

  final String message;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 5, left: 55),
            decoration: BoxDecoration(
              color: AskLoraColors.white.withOpacity(0.35),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SelectableText(message,
                style: AskLoraTextStyles.body2
                    .copyWith(color: AskLoraColors.white))));
  }
}
