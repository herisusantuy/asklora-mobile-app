import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_memoji_header.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/styles/asklora_text_styles.dart';

enum PpiResult { success, failed }

class PpiResultScreen extends StatelessWidget {
  final String memojiText;
  final String additionalMessage;
  final Widget bottomButton;
  final PpiResult? ppiResult;
  final TextStyle? additionalMessageTextStyle;
  final double bottomPadding;

  const PpiResultScreen(
      {required this.memojiText,
      required this.ppiResult,
      this.additionalMessage = '',
      required this.bottomButton,
      this.additionalMessageTextStyle,
      this.bottomPadding = 35,
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
                  LoraMemojiHeader(
                      text: memojiText,
                      loraMemojiType: ppiResult == PpiResult.success
                          ? LoraMemojiType.lora2
                          : LoraMemojiType.lora6),
                  if (additionalMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 36, vertical: 0),
                      child: CustomTextNew(
                        additionalMessage,
                        style:
                            additionalMessageTextStyle ?? AskLoraTextStyles.h4,
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: bottomPadding),
                child: bottomButton,
              )
            ],
          ),
        ),
      );
    });
  }
}
