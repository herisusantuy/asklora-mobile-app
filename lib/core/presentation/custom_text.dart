import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool ellipsis;
  final TextAlign textAlign;
  final int? maxLines;
  final TextStyle textStyle;

  const CustomText(
    this.text, {
    Key? key,
    this.ellipsis = false,
    this.textAlign = TextAlign.start,
    this.maxLines,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: textStyle,
        overflow: ellipsis ? TextOverflow.ellipsis : null,
        textAlign: textAlign,
        maxLines: maxLines,
        textHeightBehavior:
            const TextHeightBehavior(applyHeightToFirstAscent: false));
  }
}
