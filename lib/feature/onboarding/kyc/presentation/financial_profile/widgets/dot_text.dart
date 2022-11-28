import 'package:flutter/material.dart';

import '../../../../../../core/presentation/custom_text.dart';
import '../../../../../../core/values/app_values.dart';

class DotText extends StatelessWidget {
  final String text;
  final Color color;

  const DotText(this.text, {this.color = Colors.black, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppValues.screenHorizontalPadding.copyWith(top: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
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
                padding: const EdgeInsets.only(left: 14),
              ),
            ),
          ],
        ),
      );
}
