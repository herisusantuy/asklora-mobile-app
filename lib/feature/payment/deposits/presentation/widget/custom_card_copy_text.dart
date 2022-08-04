import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/presentation/custom_snack_bar.dart';
import '../../../../../core/presentation/custom_text.dart';

class CustomCardCopyText extends StatelessWidget {
  final String label;
  final String text;
  final String message;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;
  final TextAlign textAlign;
  final Key? keyCopyButton;

  const CustomCardCopyText({
    Key? key,
    this.label = '',
    this.text = '',
    this.message = '',
    this.keyCopyButton,
    this.textAlign = TextAlign.center,
    this.padding = EdgeInsets.zero,
    this.contentPadding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            CustomText(
              label,
              type: FontType.smallTextBold,
              padding: const EdgeInsets.only(bottom: 5),
            ),
          Container(
            padding: contentPadding,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black12,
                )),
            child: Row(
              children: [
                Expanded(
                  child: CustomText(
                    text,
                    textAlign: textAlign,
                  ),
                ),
                InkWell(
                  key: keyCopyButton,
                  onTap: () async =>
                      Clipboard.setData(ClipboardData(text: text)).then(
                          (value) => CustomSnackBar(context)
                              .setMessage(message)
                              .show()),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CustomText('Copy'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
