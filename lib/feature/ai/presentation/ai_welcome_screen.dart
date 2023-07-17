import 'package:flutter/material.dart';

import '../../../core/presentation/ai/buttons/ai_send_text_button.dart';
import '../../../core/presentation/ai/lora_animation_green.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../core/presentation/ai/breathing_glowing_button.dart';
import '../../../core/values/app_values.dart';
import 'widgets/ai_layout_with_background_layout.dart';

class AiWelcomeScreen extends StatelessWidget {
  final String title;
  final Widget? child;
  final VoidCallback onBottomButtonTap;

  const AiWelcomeScreen(
      {required this.title,
      required this.onBottomButtonTap,
      this.child,
      super.key});

  @override
  Widget build(BuildContext context) => AiLayoutWithBackground(
        content: CustomStretchedLayout(
          padding:
              AppValues.screenHorizontalPadding.copyWith(bottom: 40, top: 40),
          content:
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const LoraAnimationGreen(),
            const SizedBox(
              height: 64,
            ),
            CustomTextNew(
              title,
              style: AskLoraTextStyles.h3.copyWith(color: AskLoraColors.white),
              textAlign: TextAlign.center,
            ),
            if (child != null) child!,
          ]),
          bottomButton: BreathingGlowingButton(
            height: 75.0,
            width: 75.0,
            onTap: onBottomButtonTap,
            buttonBackgroundColor: const Color(0xFF373A49),
            glowColor: Colors.white.withAlpha(100),
            child: AiSendTextButton(
              enabledButtonColor: Colors.transparent,
              onTap: onBottomButtonTap,
            ),
          ),
        ),
      );
}
