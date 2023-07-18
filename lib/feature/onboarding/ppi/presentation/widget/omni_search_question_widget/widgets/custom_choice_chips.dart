import 'package:flutter/material.dart';
import '../../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../../core/presentation/custom_text_new.dart';

class CustomChoiceChips extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool active;
  final bool enableClosedButton;
  final VoidCallback? onClosed;
  final Color? activeFillColor;
  final Color? pressedFillColor;
  final Color? fillColor;
  final TextStyle? textStyle;
  final Color? textColor;
  final Color? activeTextColor;

  const CustomChoiceChips(
      {this.label = '',
      required this.onTap,
      this.active = false,
      this.enableClosedButton = false,
      this.activeFillColor,
      this.pressedFillColor,
      this.fillColor,
      this.onClosed,
      this.textStyle,
      this.textColor,
      this.activeTextColor,
      Key? key})
      : super(key: key);

  @override
  State<CustomChoiceChips> createState() => _CustomChoiceChipsState();
}

class _CustomChoiceChipsState extends State<CustomChoiceChips> {
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
        padding: EdgeInsets.symmetric(
            horizontal: widget.active ? 12.5 : 14,
            vertical: widget.active ? 7.5 : 9),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                width: widget.active ? 3 : 1.4,
                color: _isPressed
                    ? AskLoraColors.gray
                    : widget.active
                        ? AskLoraColors.primaryGreen
                        : AskLoraColors.gray),
            color: widget.active
                ? widget.activeFillColor ??
                    AskLoraColors.primaryGreen.withOpacity(0.1)
                : _isPressed
                    ? widget.pressedFillColor ??
                        AskLoraColors.primaryGreen.withOpacity(0.2)
                    : widget.fillColor ?? Colors.transparent),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: CustomTextNew(
                widget.label,
                style: (widget.textStyle ?? AskLoraTextStyles.subtitle4)
                    .copyWith(
                        color: widget.active
                            ? widget.activeTextColor ?? AskLoraColors.charcoal
                            : widget.textColor ?? AskLoraColors.gray),
                maxLines: 3,
                ellipsis: true,
              ),
            ),
            if (widget.enableClosedButton)
              Padding(
                padding: const EdgeInsets.only(left: 8.4),
                child: GestureDetector(
                  onTap: widget.onClosed ?? () {},
                  child: Icon(
                    Icons.close,
                    color: widget.active
                        ? AskLoraColors.primaryGreen
                        : AskLoraColors.gray,
                    size: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
