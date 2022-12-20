import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/styles/asklora_text_styles.dart';

class PpiResultScreen extends StatelessWidget {
  final String memojiText;
  final String additionalMessage;
  final Widget bottomButton;

  const PpiResultScreen(
      {required this.memojiText,
      this.additionalMessage = '',
      required this.bottomButton,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  LoraMemojiWidget(text: memojiText),
                  if (additionalMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 0),
                      child: CustomTextNew(
                        additionalMessage,
                        style: AskLoraTextStyles.body1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: bottomButton,
              )
            ],
          ),
        ),
      );
    });
  }
}
