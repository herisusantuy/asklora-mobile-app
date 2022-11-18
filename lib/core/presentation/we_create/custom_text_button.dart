import 'package:flutter/material.dart';

import '../custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final FontType fontType;
  final FontStyle? fontStyle;

  const CustomTextButton(
      {required this.label,
      required this.onTap,
      this.padding,
      this.margin,
      this.fontType = FontType.bodyText,
      this.fontStyle,
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
        child: CustomText(
          label,
          type: fontType,
          fontStyle: fontStyle,
        ),
      ),
    );
  }
}
