import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';

class LinkOpenIexCloud extends StatelessWidget {
  const LinkOpenIexCloud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: 'Market data provided by IEX Cloud ',
              style: AskLoraTextStyles.body4
                  .copyWith(color: AskLoraColors.charcoal)),
          TextSpan(
              text: 'https://iexcloud.io',
              style: AskLoraTextStyles.body4.copyWith(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchUrlString('https://iexcloud.io')),
        ],
      ),
    );
  }
}
