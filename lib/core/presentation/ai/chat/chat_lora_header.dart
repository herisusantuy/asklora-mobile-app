import 'package:flutter/material.dart';

import '../../../styles/asklora_colors.dart';
import '../../../styles/asklora_text_styles.dart';
import '../../../utils/app_icons.dart';
import '../../custom_text_new.dart';

class ChatLoraHeader extends StatelessWidget {
  const ChatLoraHeader({super.key});

  @override
  Widget build(BuildContext context) => Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6.0, top: 2),
              child:
                  getPngIcon('icon_lora_ai_chat_bubble', fit: BoxFit.contain),
            ),
            CustomTextNew(
              'Lora',
              style: AskLoraTextStyles.h4.copyWith(color: AskLoraColors.white),
            ),
          ]);
}
