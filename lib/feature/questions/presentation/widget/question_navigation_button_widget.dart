import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';

class QuestionNavigationButtonWidget extends StatelessWidget {
  final Function() onNext;
  final Function() onCancel;

  const QuestionNavigationButtonWidget(
      {required this.onNext, required this.onCancel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomTextButton(
            buttonText: 'Next',
            onClick: onNext,
            borderRadius: 6,
            primaryColor: Colors.black,
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
              onTap: onCancel,
              child: const CustomText(
                'Cancel',
                type: FontType.smallText,
              )),
        ],
      ),
    );
  }
}
