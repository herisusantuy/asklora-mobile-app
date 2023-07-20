import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';

class AiWelcomeSubtitleText extends StatelessWidget {
  final String subTitle;

  const AiWelcomeSubtitleText(this.subTitle, {super.key});

  @override
  Widget build(BuildContext context) => CustomTextNew(
        subTitle,
        style: AskLoraTextStyles.body1.copyWith(color: AskLoraColors.white),
      );
}
