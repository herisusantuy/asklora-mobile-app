import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/presentation/custom_text.dart';
import '../../../core/presentation/custom_text_input.dart';

class CustomPaymentTextInput extends StatelessWidget {
  final Function(String) onChanged;
  final String titleText;
  final String labelText;
  final String errorText;
  final String hintText;
  final String initialValue;
  final TextInputType textInputType;
  final String prefixText;
  final List<TextInputFormatter>? textInputFormatterList;
  final double paddingBottom;

  const CustomPaymentTextInput(
      {required this.hintText,
      required this.onChanged,
      this.textInputType = TextInputType.text,
      this.textInputFormatterList,
      this.prefixText = '',
      this.initialValue = '',
      this.paddingBottom = 20,
      this.titleText = '',
      this.labelText = '',
      this.errorText = '',
      Key? key})
      : super(key: key);

  InputBorder get customBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide:
            const BorderSide(style: BorderStyle.none, color: Colors.white),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleText.isNotEmpty)
            CustomText(
              titleText,
              type: FontType.smallTextBold,
              padding: const EdgeInsets.only(bottom: 6),
            ),
          CustomTextInput(
              textInputType: textInputType,
              textInputFormatterList: textInputFormatterList,
              initialValue: initialValue,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              inputBorder: customBorder,
              enabledBorder: customBorder,
              focusedBorder: customBorder,
              fillColor: Colors.white,
              prefixText: prefixText,
              labelText: labelText,
              onChanged: onChanged,
              errorText: errorText,
              hintText: hintText),
        ],
      ),
    );
  }
}
