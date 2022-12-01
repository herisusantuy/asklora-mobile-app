import 'package:flutter/material.dart';

import '../../../../../../core/presentation/custom_text.dart';

class DotText extends StatelessWidget {
  final String text;
  final Color color;
  final EdgeInsets padding;
  final double fontHeight;

  const DotText(this.text, {this.color = Colors.black, this.padding = EdgeInsets.zero, this.fontHeight=1,Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding:padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 6.0+fontHeight*2),
              child: Icon(
                Icons.circle,
                size: 6,
                color: color,
              ),
            ),
            Expanded(
              child: CustomText(
                text,
                type: FontType.smallText,
                color: color,
                height: fontHeight,
                padding: const EdgeInsets.only(left: 14),
              ),
            ),
          ],
        ),
      );
}
