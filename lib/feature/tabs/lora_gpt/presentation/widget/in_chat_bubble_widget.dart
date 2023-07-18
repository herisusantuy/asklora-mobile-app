import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';

class InChatBubbleWidget extends StatelessWidget {
  const InChatBubbleWidget(
      {required this.message, required this.name, super.key});

  final String message;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTextNew(
          name,
          style:
              AskLoraTextStyles.subtitle2.copyWith(color: AskLoraColors.white),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 30),
            Flexible(
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
                          color: AskLoraColors.white.withOpacity(0.2),
                          border: Border.all(
                              width: 1.5,
                              color: AskLoraColors.white.withOpacity(0.8)),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: SelectableText(message,
                            style: AskLoraTextStyles.body2
                                .copyWith(color: AskLoraColors.white)))),
              ),
            ),
          ],
        )
      ],
    );
  }
}
