import 'package:flutter/material.dart';

class QuestionHeader extends StatelessWidget {
  final Function() onTapBack;

  const QuestionHeader({Key? key, required this.onTapBack}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: InkWell(
            onTap: onTapBack,
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 24,
              color: Colors.black,
            )),
      );
}
