import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';

class QuestionHeader extends StatelessWidget {
  final Function() onTapBack;
  const QuestionHeader(
      {Key? key, required this.questionText, required this.onTapBack})
      : super(key: key);

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: onTapBack,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 24,
                color: Colors.black,
              ),
            )),
        if (questionText.isNotEmpty)
          CustomText(
            questionText,
            type: FontType.h5,
            padding: const EdgeInsets.only(top: 8),
          ),
      ],
    );
  }
}
