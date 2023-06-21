import 'package:flutter/material.dart';

import 'column_text_with_tooltip.dart';

class PairColumnTextWithTooltip extends StatelessWidget {
  final String leftTitle;
  final String leftSubTitle;
  final String? leftTooltipText;
  final String rightTitle;
  final String rightSubTitle;
  final String? rightTooltipText;
  final double? spaceWidth;

  const PairColumnTextWithTooltip(
      {required this.leftTitle,
      required this.rightTitle,
      required this.leftSubTitle,
      required this.rightSubTitle,
      this.leftTooltipText,
      this.rightTooltipText,
      this.spaceWidth,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ColumnTextWithTooltip(
              title: leftTitle,
              subTitle: leftSubTitle,
              tooltipText: leftTooltipText),
        ),
        if (spaceWidth != null)
          SizedBox(
            width: spaceWidth,
          ),
        Expanded(
          child: ColumnTextWithTooltip(
              title: rightTitle,
              subTitle: rightSubTitle,
              tooltipText: rightTooltipText),
        ),
      ],
    );
  }
}
