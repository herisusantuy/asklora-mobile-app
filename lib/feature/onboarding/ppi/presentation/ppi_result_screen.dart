import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../welcome/widgets/memoji_widget.dart';

class PpiResultScreen extends StatelessWidget {
  final String mEmojiText;
  final String additionalMessage;
  final Widget bottomButton;

  const PpiResultScreen(
      {required this.mEmojiText,
      this.additionalMessage = '',
      required this.bottomButton,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.transparent(),
      body: Column(
        children: [
          MEmojiWidget(text: mEmojiText, imageAsset: '/'),
          if (additionalMessage.isNotEmpty)
            CustomText(
              additionalMessage,
              type: FontType.h3W800,
              textAlign: TextAlign.center,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            ),
          const Expanded(child: SizedBox()),
          bottomButton
        ],
      ),
    );
  }
}
