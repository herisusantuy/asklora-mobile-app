import 'package:flutter/material.dart';
import '../../../../core/presentation/custom_text.dart';

class Header extends StatelessWidget {
  const Header(
      {Key? key,
      this.questionNumber = '',
      required this.header,
      this.subHeader = ''})
      : super(key: key);

  final String questionNumber;
  final String header;
  final String subHeader;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: CustomText(
              header,
              type: FontType.h5,
            )),
            if (questionNumber.isNotEmpty)
              CustomText(
                questionNumber,
                type: FontType.bodyTextBold,
              ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        if (subHeader.isNotEmpty)
          CustomText(
            subHeader,
            type: FontType.bodyTextBold,
          ),
      ],
    );
  }
}
