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
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Stack(
        children: [
          Center(
              child: SvgPicture.asset(
                  'assets/images/memoji_background_green.svg')),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/memoji.png'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextNew(
                    text,
                    style: AskLoraTextStyles.h4,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
