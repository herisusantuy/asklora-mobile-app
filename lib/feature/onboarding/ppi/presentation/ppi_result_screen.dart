import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/values/app_values.dart';

enum PpiResult { success, failed }

class PpiResultScreen extends StatelessWidget {
  final String title;
  final String additionalMessage;
  final Widget bottomButton;
  final Widget? richText;
  final PpiResult? ppiResult;
  final TextStyle? additionalMessageTextStyle;
  final double bottomPadding;

  const PpiResultScreen(
      {required this.title,
      required this.ppiResult,
      this.additionalMessage = '',
      required this.bottomButton,
      this.additionalMessageTextStyle,
      this.richText,
      this.bottomPadding = 35,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, viewportConstraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
          child: Padding(
            padding: AppValues.screenHorizontalPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(20),
                        child: ppiResult == PpiResult.success
                            ? loraGreenAnimation
                            : loraMagentaAnimation),
                    CustomTextNew(title,
                        style: AskLoraTextStyles.h4
                            .copyWith(color: AskLoraColors.charcoal),
                        textAlign: TextAlign.center),
                    const SizedBox(height: 40),
                    if (additionalMessage.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 36, vertical: 0),
                        child: CustomTextNew(additionalMessage,
                            style: additionalMessageTextStyle ??
                                AskLoraTextStyles.h4,
                            textAlign: TextAlign.center),
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
        ),
      );
    });
  }
}
