import 'package:flutter/material.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../../../core/styles/asklora_text_styles.dart';

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
          LoraMemojiWidget(text: mEmojiText, imageAsset: '/'),
          if (additionalMessage.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
              child: CustomTextNew(
                additionalMessage,
                style: AskLoraTextStyles.body1,
                textAlign: TextAlign.center,
              ),
            ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: bottomButton,
          )
        ],
      ),
    );
  }
}
