import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_text_styles.dart';

class QuestionTitle extends StatelessWidget {
  final String question;

  const QuestionTitle({required this.question, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 45),
        child: CustomTextNew(
          question,
          style: AskLoraTextStyles.h3,
        ),
      );
}
