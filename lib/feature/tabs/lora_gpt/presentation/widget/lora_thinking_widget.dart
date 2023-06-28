import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import 'jumping_dots_lora_gpt.dart';

class LoraThinkingWidget extends StatelessWidget {
  const LoraThinkingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              style: AskLoraTextStyles.subtitle2
                  .copyWith(color: AskLoraColors.white),
            )
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.only(right: 30.0),
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 7,
                sigmaY: 7,
              ),
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.5, color: AskLoraColors.cyan.withOpacity(0.8)),
                  color: AskLoraColors.white.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: JumpingDotsLoraGptWidget(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
