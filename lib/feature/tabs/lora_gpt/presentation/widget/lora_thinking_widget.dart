import 'package:flutter/material.dart';

import '../../../../../core/styles/asklora_colors.dart';
import 'jumping_dots_lora_gpt.dart';

class LoraThinkingWidget extends StatelessWidget {
  const LoraThinkingWidget({super.key});

  @override
  Widget build(BuildContext context) => Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 5, left: 20, right: 40),
        decoration: BoxDecoration(
          color: AskLoraColors.white.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: JumpingDotsLoraGptWidget(),
      ));
}
