import 'package:flutter/material.dart';

import '../../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../../core/styles/asklora_text_styles.dart';

enum ButtonExtraInfoSize { small, big }

class ExtraInfoButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Widget? suffixIcon;
  final ButtonExtraInfoSize buttonExtraInfoSize;

  const ExtraInfoButton(
      {this.label = '',
      required this.onTap,
      this.suffixIcon,
      this.buttonExtraInfoSize = ButtonExtraInfoSize.big,
      Key? key})
      : super(key: key);

  @override
  State<ExtraInfoButton> createState() => _ExtraInfoButtonState();
}

class _ExtraInfoButtonState extends State<ExtraInfoButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTap: widget.onTap,
      child: Container(
        constraints: BoxConstraints(
            minHeight: widget.buttonExtraInfoSize == ButtonExtraInfoSize.big
                ? 43
                : 27),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1.4, color: AskLoraColors.primaryMagenta),
            color: _isPressed
                ? AskLoraColors.primaryMagenta.withOpacity(0.2)
                : Colors.transparent),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextNew(widget.label,
                style: widget.buttonExtraInfoSize == ButtonExtraInfoSize.big
                    ? AskLoraTextStyles.subtitle2
                        .copyWith(color: AskLoraColors.primaryMagenta)
                    : AskLoraTextStyles.subtitle3
                        .copyWith(color: AskLoraColors.primaryMagenta)),
            if (widget.suffixIcon != null)
              Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: widget.suffixIcon)
          ],
        ),
      ),
    );
  }
}
