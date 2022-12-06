import 'package:flutter/material.dart';

class CustomTextNew extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CustomTextNew(this.text, {this.style, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: style,
        textHeightBehavior:
            const TextHeightBehavior(applyHeightToFirstAscent: false));
  }
}
