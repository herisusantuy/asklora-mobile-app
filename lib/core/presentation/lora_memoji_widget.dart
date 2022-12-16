import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/asklora_text_styles.dart';
import 'custom_text_new.dart';

class LoraMemojiWidget extends StatelessWidget {
  final String text;

  const LoraMemojiWidget(
      {required this.text, Key? key = const Key('memoji_widget')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40, left: 0, right: 0),
        ),
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset('assets/images/memoji_background_green.svg'),
            Image.asset('assets/images/memoji.png'),
          ],
        ),
        Container(
            transform: Matrix4.translationValues(0.0, -35.0, 0.0),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomTextNew(
              text,
              style: AskLoraTextStyles.h4,
              textAlign: TextAlign.center,
            )),
      ],
    );
  }
}
