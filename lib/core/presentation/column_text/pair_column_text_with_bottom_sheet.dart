import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import 'column_text_with_bottom_sheet.dart';

class PairColumnTextWithBottomSheet extends StatelessWidget {
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
  final String? buttonLabel;

  const PairColumnTextWithBottomSheet(
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
      this.buttonLabel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ColumnTextWithBottomSheet(
            subTitleColor: leftSubTitleColor,
            crossAxisAlignment: columnTextCrossAxisAlignment,
            title: leftTitle,
            subTitle: leftSubTitle,
            tooltipText: leftTooltipText,
            buttonLabel: buttonLabel ?? S.of(context).buttonBack,
          ),
        ),
        if (spaceWidth != null)
          SizedBox(
            width: spaceWidth,
          ),
        Expanded(
          child: ColumnTextWithBottomSheet(
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
