import 'package:flutter/material.dart';

import '../../styles/asklora_colors.dart';
import '../custom_text_new.dart';

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
      child: GestureDetector(
        onTap: onTap,
        child: CustomTextNew(
          label,
          fontSize: 15,
          fontStyle: fontStyle,
          color: AskLoraColors.charcoal,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
