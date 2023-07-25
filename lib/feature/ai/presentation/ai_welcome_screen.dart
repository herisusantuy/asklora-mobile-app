import 'package:flutter/material.dart';

import '../../../core/presentation/ai/buttons/ai_send_text_button.dart';
import '../../../core/presentation/ai/lora_animation_green.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../core/values/app_values.dart';
import '../../../core/presentation/ai/buttons/glowing_button.dart';
import '../../../core/presentation/ai/utils/ai_utils.dart';
import 'widgets/ai_layout_with_background_layout.dart';

class AiWelcomeScreen extends StatelessWidget {
  final AiThemeType aiThemeType;
  final String title;
  final Widget? child;
  final VoidCallback onBottomButtonTap;
  final bool enableBackgroundImage;

  const AiWelcomeScreen(
      {this.aiThemeType = AiThemeType.light,
      required this.title,
      required this.onBottomButtonTap,
      this.child,
      this.enableBackgroundImage = true,
      super.key});

  @override
  Widget build(BuildContext context) => enableBackgroundImage
      ? AiLayoutWithBackground(
          aiThemeType: aiThemeType,
          content: _content,
        )
      : _content;

  Widget get _content => CustomScaffold(
        enableBackNavigation: false,
        appBarBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        body: CustomStretchedLayout(
          padding:
              AppValues.screenHorizontalPadding.copyWith(bottom: 40, top: 40),
          content: SizedBox(
            width: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const LoraAnimationGreen(),
              const SizedBox(
                height: 64,
              ),
              CustomTextNew(
                title,
                style: AskLoraTextStyles.h3
                    .copyWith(color: aiThemeType.primaryFontColor),
                textAlign: TextAlign.center,
              ),
              if (child != null) child!,
            ]),
          ),
          bottomButton: GlowingButton(
            height: 75.0,
            width: 75.0,
            onTap: onBottomButtonTap,
            buttonBackgroundColor: aiThemeType.startButtonFillColor,
            glowColor: Colors.white.withAlpha(100),
            child: AiSendTextButton(
              borderColor: AskLoraColors.lightGray,
              enabledButtonColor: AskLoraColors.whiteSmoke.withOpacity(0.5),
              onTap: onBottomButtonTap,
            ),
          ),
        ),
      );
}
