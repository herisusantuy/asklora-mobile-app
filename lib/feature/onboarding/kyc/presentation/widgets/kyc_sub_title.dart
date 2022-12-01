import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';

class KycSubTitle extends StatelessWidget {
  final EdgeInsets padding;
  final String subTitle;

  const KycSubTitle(
      {required this.subTitle, this.padding = EdgeInsets.zero, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText(
      subTitle,
      type: FontType.h4,
      padding: padding,
    );
  }
}
