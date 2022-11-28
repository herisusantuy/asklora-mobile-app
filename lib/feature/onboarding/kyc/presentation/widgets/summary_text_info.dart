import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/values/app_values.dart';

class SummaryTextInfo extends StatelessWidget {
  final Widget? titleWidget;
  final String? title;
  final String subTitle;

  const SummaryTextInfo(
      {this.titleWidget, this.title, required this.subTitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleWidget != null) titleWidget!,
          if (title != null)
            CustomText(
              title!,
              type: FontType.smallText,
              color: Colors.grey,
            ),
          CustomText(
            subTitle,
            type: FontType.smallTextBold,
            padding: const EdgeInsets.only(top: 6),
          ),
        ],
      ),
    );
  }
}
