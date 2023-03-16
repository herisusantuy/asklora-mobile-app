import 'package:flutter/material.dart';

import 'column_text.dart';

class PairColumnText extends StatelessWidget {
  final String leftTitle;
  final String leftSubTitle;
  final String? leftTooltipText;
  final String rightTitle;
  final String rightSubTitle;
  final String? rightTooltipText;

  const PairColumnText(
      {required this.leftTitle,
      required this.rightTitle,
      required this.leftSubTitle,
      required this.rightSubTitle,
      this.leftTooltipText,
      this.rightTooltipText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ColumnText(
              title: leftTitle,
              subTitle: leftSubTitle,
              tooltipText: leftTooltipText),
        ),
        Expanded(
          child: ColumnText(
              title: rightTitle,
              subTitle: rightSubTitle,
              tooltipText: rightTooltipText),
        ),
      ],
    );
  }
}
