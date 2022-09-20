import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String errorText;
  final int? maxLength;
  final bool obscureText;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final List<TextInputFormatter>? textInputFormatterList;
  final String? initialValue;
  final String prefixText;
  final String suffixText;
  final Color? fillColor;
  final InputBorder inputBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextEditingController? controller;

  const CustomTextInput(
      {required this.labelText,
      required this.onChanged,
      this.hintText = '',
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.errorText = '',
      this.maxLength,
      this.textInputFormatterList,
      this.initialValue,
      this.fillColor,
      this.inputBorder = const OutlineInputBorder(),
      this.floatingLabelBehavior,
      this.enabledBorder,
      this.disabledBorder,
      this.focusedBorder,
      this.prefixText = '',
      this.suffixText = '',
      this.textCapitalization = TextCapitalization.none,
      this.textAlign = TextAlign.start,
      this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        textCapitalization: textCapitalization,
        initialValue: initialValue,
        inputFormatters: textInputFormatterList,
        maxLength: maxLength,
        obscureText: obscureText,
        textAlign: textAlign,
        decoration: InputDecoration(
            floatingLabelBehavior: floatingLabelBehavior,
            filled: fillColor != null ? true : false,
            fillColor: fillColor,
            border: inputBorder,
            labelText: labelText,
            counterText: '',
            hintText: hintText,
            prefixText: prefixText.isEmpty ? null : '$prefixText  ',
            suffixText: suffixText.isEmpty ? null : '$suffixText  ',
            enabledBorder: enabledBorder,
            disabledBorder: disabledBorder,
            focusedBorder: focusedBorder,
            errorText: errorText.isEmpty ? null : errorText),
        onChanged: (str) => onChanged(str),
        keyboardType: textInputType,
      );
}
