import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';

class InChatBubbleWidget extends StatelessWidget {
  const InChatBubbleWidget(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTextNew(
          'Mel',
          style: AskLoraTextStyles.subtitle2,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 30),
            Flexible(
              child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                    color: AskLoraColors.charcoal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: CustomTextNew(message,
                      style: AskLoraTextStyles.subtitle2
                          .copyWith(color: AskLoraColors.white))),
            ),
          ],
        )
      ],
    );
  }
}
