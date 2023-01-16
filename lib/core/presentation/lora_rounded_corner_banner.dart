import 'package:flutter/cupertino.dart';

import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';
import 'custom_text_new.dart';
import 'lora_memoji_widget.dart';

class LoraRoundedCornerBanner extends StatelessWidget {
  const LoraRoundedCornerBanner({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        decoration: BoxDecoration(
            color: AskLoraColors.lightGreen,
            borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LoraMemojiWidget(
              loraMemojiType: LoraMemojiType.lora1,
              height: 78,
              width: 78,
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: CustomTextNew(
                'Go search for stocks with keywords or phrases, Lora will get you the relevant stocks!',
                style: AskLoraTextStyles.body1,
              ),
            )
          ],
        ),
      );
}
