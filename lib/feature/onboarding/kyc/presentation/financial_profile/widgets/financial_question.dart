import 'package:flutter/material.dart';

import '../../../../../../core/presentation/custom_text.dart';
import '../../../../../../core/values/app_values.dart';

class FinancialQuestion extends StatelessWidget {
  final String question;
  const FinancialQuestion(this.question,
      {Key? key = const Key('financial_question')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomText(question,
        type: FontType.h5,
        padding: AppValues.screenHorizontalPadding.copyWith(bottom: 14));
  }
}
