import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomExpandedRow extends StatelessWidget {
  final String label;
  final String text;
  final FontType fontType;
  final Widget? child;
  final EdgeInsets padding;
  final int flex1;
  final int flex2;
  final TextAlign textValueAlign;

  const CustomExpandedRow(this.label,
      {this.text = '',
      this.fontType = FontType.bodyText,
      this.child,
      this.flex1 = 2,
      this.flex2 = 1,
      this.padding = const EdgeInsets.only(bottom: 8),
      this.textValueAlign = TextAlign.right,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: flex1,
              child: CustomText(
                label,
                type: fontType,
              )),
          Expanded(
              flex: flex2,
              child: child ??
                  CustomText(
                    text,
                    type: fontType,
                    textAlign: textValueAlign,
                  ))
        ],
      ),
    );
  }
}
