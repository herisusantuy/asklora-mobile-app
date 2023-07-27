import 'package:flutter/material.dart';
import '../../../styles/asklora_text_styles.dart';
import '../../custom_text_new.dart';
import '../lora_animation_green.dart';
import '../utils/ai_utils.dart';

class ChatLoraHeader extends StatelessWidget {
  final AiThemeType aiThemeType;

  const ChatLoraHeader({this.aiThemeType = AiThemeType.dark, super.key});

  @override
  Widget build(BuildContext context) => Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.only(right: 6.0, top: 2),
                child: LoraAnimationGreen(
                  height: 32,
                  width: 32,
                )),
            CustomTextNew(
              'Lora',
              style: AskLoraTextStyles.h4
                  .copyWith(color: aiThemeType.primaryFontColor),
            ),
          ]);
}
