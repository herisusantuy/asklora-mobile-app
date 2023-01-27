import 'package:flutter/material.dart';

import '../styles/asklora_text_styles.dart';
import 'custom_text.dart';
import 'custom_text_new.dart';

class CustomExpandedRow extends StatelessWidget {
  final String label;
  final String text;
  final TextStyle? textStyle;
  final Widget? child;
  final EdgeInsets padding;
  final int flex1;
  final int flex2;
  final TextAlign textValueAlign;
  final CrossAxisAlignment crossAxisAlignment;
  final FontType? fontType;

  const CustomExpandedRow(this.label,
      {this.text = '',
      this.fontType,
      this.textStyle,
      this.child,
      this.flex1 = 2,
      this.flex2 = 1,
      this.padding = const EdgeInsets.only(bottom: 8),
      this.textValueAlign = TextAlign.right,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Expanded(
              flex: flex1,
              child: CustomTextNew(
                label,
                style: textStyle ?? AskLoraTextStyles.body1,
              )),
          Expanded(
              flex: flex2,
              child: child ??
                  CustomTextNew(
                    text,
                    style: textStyle ?? AskLoraTextStyles.body1,
                    textAlign: textValueAlign,
                  ))
        ],
      ),
    );
  }
}
