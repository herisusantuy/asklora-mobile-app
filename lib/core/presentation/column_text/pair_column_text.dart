import 'package:flutter/material.dart';

import 'column_text.dart';

class PairColumnText extends StatelessWidget {
  final String leftTitle;
  final String leftSubTitle;
  final String rightTitle;
  final String rightSubTitle;
  final double? spaceWidth;
  final int? maxLines;
  final bool ellipsis;

  const PairColumnText(
      {required this.leftTitle,
      required this.rightTitle,
      required this.leftSubTitle,
      required this.rightSubTitle,
      this.spaceWidth = 10,
      this.maxLines,
      this.ellipsis = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ColumnText(
            title: leftTitle,
            subTitle: leftSubTitle,
            ellipsis: ellipsis,
            maxLines: maxLines,
          ),
        ),
        if (spaceWidth != null)
          SizedBox(
            width: spaceWidth,
          ),
        Expanded(
          child: ColumnText(
            title: rightTitle,
            subTitle: rightSubTitle,
            ellipsis: ellipsis,
            maxLines: maxLines,
          ),
        ),
      ],
    );
  }
}
