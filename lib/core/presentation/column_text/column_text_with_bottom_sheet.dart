import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../generated/l10n.dart';
import '../lora_bottom_sheet.dart';

class ColumnTextWithBottomSheet extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color? subTitleColor;
  final String? tooltipText;
  final CrossAxisAlignment? crossAxisAlignment;
  final String? buttonLabel;

  const ColumnTextWithBottomSheet(
      {required this.title,
      required this.subTitle,
      this.tooltipText,
      this.crossAxisAlignment,
      this.subTitleColor,
      this.buttonLabel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: CustomTextNew(
                title,
                style: AskLoraTextStyles.body4
                    .copyWith(color: AskLoraColors.charcoal),
              ),
            ),
            if (tooltipText != null)
              GestureDetector(
                onTap: () => LoraBottomSheet.show(
                  context: context,
                  title: title,
                  subTitle: tooltipText,
                  primaryButtonLabel: buttonLabel ?? S.of(context).buttonBack,
                  onPrimaryButtonTap: () => Navigator.pop(context),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: getSvgIcon('icon_info'),
                ),
              )
          ],
        ),
        CustomTextNew(subTitle,
            style: AskLoraTextStyles.subtitle2
                .copyWith(color: subTitleColor ?? AskLoraColors.charcoal)),
        const SizedBox(
          height: 1,
        ),
      ],
    );
  }
}
