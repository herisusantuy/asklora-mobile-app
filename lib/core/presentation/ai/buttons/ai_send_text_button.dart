import 'package:flutter/material.dart';

import '../../../styles/asklora_colors.dart';
import '../../../utils/app_icons.dart';

class AiSendTextButton extends StatelessWidget {
  final bool isDisabled;
  final VoidCallback onTap;
  final Color? enabledButtonColor;
  final Color? disabledButtonColor;
  final Size? size;

  const AiSendTextButton(
      {this.isDisabled = false,
      required this.onTap,
      this.enabledButtonColor,
      this.disabledButtonColor,
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
            side: const BorderSide(color: AskLoraColors.white),
            backgroundColor: isDisabled
                ? disabledButtonColor ?? AskLoraColors.gray.withOpacity(0.2)
                : enabledButtonColor ?? AskLoraColors.primaryGreen,
            shape: const CircleBorder(),
            elevation: 0,
            fixedSize: size,
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: getSvgIcon('icon_sent_text', color: AskLoraColors.white),
          ),
        ),
      );
}
