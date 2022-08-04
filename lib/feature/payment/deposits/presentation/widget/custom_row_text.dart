import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';

class CustomRowText extends StatelessWidget {
  final String index;
  final String text;
  final EdgeInsets padding;
  final FontType fontType;

  const CustomRowText(
      {Key? key,
      this.index = '1',
      this.text = 'text',
      this.padding = EdgeInsets.zero,
      this.fontType = FontType.bodyText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 1,
              child: CustomText(
                '$index.',
                type: fontType,
              )),
          Expanded(flex: 14, child: CustomText(text, type: fontType)),
        ],
      ),
    );
  }
}
