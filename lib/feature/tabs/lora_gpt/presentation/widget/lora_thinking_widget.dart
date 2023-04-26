import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import 'jumping_dots_lora_gpt.dart';
import 'utils/triangle_chat_bubble_painter.dart';

class LoraThinkingWidget extends StatelessWidget {
  const LoraThinkingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AskLoraColors.whiteSmoke),
              child: const LoraMemojiWidget(
                loraMemojiType: LoraMemojiType.lora7,
                height: 30,
                width: 30,
              ),
            ),
            const SizedBox(width: 12),
            CustomTextNew(
              'Lora',
              style: AskLoraTextStyles.subtitle2,
            )
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(pi),
              child: CustomPaint(
                painter: TriangleChatBubblePainter(AskLoraColors.lightGreen),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 5),
                decoration: const BoxDecoration(
                  color: AskLoraColors.lightGreen,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: JumpingDotsLoraGptWidget(),
              ),
            ),
            const SizedBox(
              width: 30,
            )
          ],
        )
      ],
    );
  }
}
