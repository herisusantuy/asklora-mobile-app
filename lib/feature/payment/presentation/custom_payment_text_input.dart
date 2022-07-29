import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/presentation/custom_text.dart';
import '../../../core/presentation/custom_text_input.dart';

class CustomPaymentTextInput extends StatelessWidget {
  final Function(String) onChanged;
  final String labelText;
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
      this.labelText = '',
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
          CustomText(
            labelText,
            type: FontType.smallTextBold,
          ),
          const SizedBox(
            height: 6,
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
              hintText: hintText),
        ],
      ),
    );
  }
}
