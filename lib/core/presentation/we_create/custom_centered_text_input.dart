

import 'package:flutter/material.dart';

import '../custom_text_input.dart';

class CustomCenteredTextInput extends StatelessWidget {
  final Function(String) onChanged;
  final String labelText;
  final String hintText;
  final String? initialValue;
  final EdgeInsets padding;
  const CustomCenteredTextInput({required this.onChanged, this.labelText='', this.hintText='', this.initialValue,this.padding=EdgeInsets.zero, Key? key}) : super(key: key);

  final TextStyle textStyle =
      const TextStyle(fontSize: 26, fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CustomTextInput(
        initialValue: initialValue,
        labelText: labelText,
        hintText: hintText,
        inputBorder: InputBorder.none,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintTextStyle: textStyle.copyWith(color: Colors.grey[300]),
        textStyle: textStyle.copyWith(color: Colors.black),
        textAlign: TextAlign.center,
        onChanged: onChanged,
      ),
    );
  }
}
