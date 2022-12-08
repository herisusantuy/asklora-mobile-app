import 'package:flutter/material.dart';

import '../../styles/asklora_colors.dart';
import '../custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final FontStyle fontStyle;

  const CustomTextButton(
      {required this.label,
      required this.onTap,
      this.padding,
      this.margin,
      this.fontStyle = FontStyle.italic,
      this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onTap,
        child: CustomText(
          label,
          type: FontType.button,
          fontStyle: fontStyle,
          color: AskLoraColors.charcoal,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
