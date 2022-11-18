import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_text_input.dart';

class CustomCenteredTextInput extends StatelessWidget {
  final Function(String) onChanged;
  final String labelText;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatterList;
  final String hintText;
  final String? initialValue;
  final EdgeInsets padding;

  const CustomCenteredTextInput(
      {required this.onChanged,
      this.labelText = '',
      this.hintText = '',
      this.initialValue,
      this.padding = EdgeInsets.zero,
      this.textInputType = TextInputType.text,
        this.textInputFormatterList,
      Key? key})
      : super(key: key);

  final TextStyle textStyle =
      const TextStyle(fontSize: 26, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CustomTextInput(
        textInputType: textInputType,
        initialValue: initialValue,
        labelText: labelText,
        hintText: hintText,
        inputBorder: InputBorder.none,
        textInputFormatterList: textInputFormatterList,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintTextStyle: textStyle.copyWith(color: Colors.grey[300]),
        textStyle: textStyle.copyWith(color: Colors.black),
        textAlign: TextAlign.center,
        onChanged: onChanged,
      ),
    );
  }
}
