import 'package:flutter/material.dart';

import '../../../../../../core/presentation/custom_text.dart';
import '../../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../../../core/values/app_values.dart';

class ChoicesButton extends StatelessWidget {
  final Function() onAnswerYes;
  final Function() onAnswerNo;
  final Function() onSaveForLater;

  const ChoicesButton(
      {required this.onAnswerYes,
      required this.onAnswerNo,
      required this.onSaveForLater,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: AppValues.screenHorizontalPadding.copyWith(bottom: 22),
      child: Column(
        children: [
          CustomButton(
            key: const Key('yes_button'),
            fontStyle: FontStyle.normal,
            label: 'Yes',
            onClick: onAnswerYes,
            borderRadius: 6,
            fontType: FontType.bodyText,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            borderSide: const BorderSide(color: Colors.grey),
          ),
          CustomButton(
            key: const Key('no_button'),
            margin: const EdgeInsets.only(top: 14),
            fontStyle: FontStyle.normal,
            label: 'No',
            onClick: onAnswerNo,
            borderRadius: 6,
            fontType: FontType.bodyText,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            borderSide: const BorderSide(color: Colors.grey),
          ),
          CustomTextButton(
            key: const Key('save_for_later_button'),
            margin: const EdgeInsets.only(top: 24),
            label: 'SAVE FOR LATER',
            onTap: onSaveForLater,
          )
        ],
      ),
    );
  }
}
