import 'package:flutter/material.dart';

import 'column_text.dart';

class PairColumnText extends StatelessWidget {
  final String title1;
  final String subTitle1;
  final String? tooltipText1;
  final String title2;
  final String subTitle2;
  final String? tooltipText2;

  const PairColumnText(
      {required this.title1,
      required this.title2,
      required this.subTitle1,
      required this.subTitle2,
      this.tooltipText1,
      this.tooltipText2,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ColumnText(
              title: title1, subTitle: subTitle1, tooltipText: tooltipText1),
        ),
        Expanded(
          child: ColumnText(
              title: title2, subTitle: subTitle2, tooltipText: tooltipText2),
        ),
      ],
    );
  }
}
