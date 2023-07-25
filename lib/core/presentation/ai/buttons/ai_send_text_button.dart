import 'package:flutter/material.dart';

import '../../../styles/asklora_colors.dart';
import '../../../utils/app_icons.dart';

class AiSendTextButton extends StatelessWidget {
  final bool isDisabled;
  final VoidCallback onTap;
  final Color borderColor;
  final Color? enabledButtonColor;
  final Color? disabledButtonColor;
  final Color? enabledIconColor;
  final Color? disabledIconColor;
  final Size? size;

  const AiSendTextButton(
      {this.isDisabled = false,
      required this.onTap,
      this.enabledButtonColor,
      this.disabledButtonColor,
      this.borderColor = AskLoraColors.white,
      this.enabledIconColor = AskLoraColors.gray,
      this.disabledIconColor = AskLoraColors.gray,
      this.size,
      super.key});

  @override
  Widget build(BuildContext context) => AbsorbPointer(
        absorbing: isDisabled,
        child: ElevatedButton(
          onPressed: () {
            FocusScope.of(context).unfocus();
            onTap();
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: borderColor),
            backgroundColor: isDisabled
                ? disabledButtonColor ?? AskLoraColors.gray.withOpacity(0.2)
                : enabledButtonColor ?? AskLoraColors.primaryGreen,
            shape: const CircleBorder(),
            elevation: 0,
            fixedSize: size,
          ),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: getSvgIcon('icon_sent_text',
                color: isDisabled ? disabledIconColor : enabledIconColor),
          ),
        ),
      );
}
