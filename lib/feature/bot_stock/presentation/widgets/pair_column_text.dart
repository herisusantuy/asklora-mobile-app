import 'package:flutter/material.dart';

import 'column_text.dart';

class PairColumnText extends StatelessWidget {
  final String leftTitle;
  final String leftSubTitle;
  final Color? leftSubTitleColor;
  final String? leftTooltipText;
  final String rightTitle;
  final String rightSubTitle;
  final Color? rightSubTitleColor;
  final String? rightTooltipText;
  final double? spaceWidth;
  final CrossAxisAlignment? columnTextCrossAxisAlignment;

  const PairColumnText(
      {required this.leftTitle,
      required this.rightTitle,
      required this.leftSubTitle,
      required this.rightSubTitle,
      this.leftSubTitleColor,
      this.rightSubTitleColor,
      this.leftTooltipText,
      this.rightTooltipText,
      this.spaceWidth,
      this.columnTextCrossAxisAlignment,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ColumnText(
              subTitleColor: leftSubTitleColor,
              crossAxisAlignment: columnTextCrossAxisAlignment,
              title: leftTitle,
              subTitle: leftSubTitle,
              tooltipText: leftTooltipText),
        ),
        if (spaceWidth != null)
          SizedBox(
            width: spaceWidth,
          ),
        Expanded(
          child: ColumnText(
              subTitleColor: rightSubTitleColor,
              crossAxisAlignment: columnTextCrossAxisAlignment,
              title: rightTitle,
              subTitle: rightSubTitle,
              tooltipText: rightTooltipText),
        ),
      ],
    );
  }
}
