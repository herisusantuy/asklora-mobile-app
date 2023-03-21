import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_status_widget.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/lora_memoji_header.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/styles/asklora_text_styles.dart';

enum PpiResult { success, failed }

class PpiResultScreen extends StatelessWidget {
  final String memojiText;
  final String additionalMessage;
  final Widget bottomButton;
  final Widget? richText;
  final PpiResult? ppiResult;
  final TextStyle? additionalMessageTextStyle;
  final double bottomPadding;
  final LoraMemojiType loraMemojiType;

  const PpiResultScreen(
      {required this.memojiText,
      required this.ppiResult,
      this.additionalMessage = '',
      required this.bottomButton,
      this.additionalMessageTextStyle,
      this.richText,
      this.bottomPadding = 35,
      this.loraMemojiType = LoraMemojiType.lora2,
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
                  if (ppiResult == PpiResult.success)
                    LoraMemojiHeader(
                        text: memojiText, loraMemojiType: loraMemojiType)
                  else
                    CustomStatusWidget(
                      title: memojiText,
                      statusType: StatusType.failed,
                    ),
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
                  if (richText != null) richText!,
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
