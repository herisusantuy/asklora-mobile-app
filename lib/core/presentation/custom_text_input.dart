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
  final String initialValue;

  const CustomTextInput(
      {required this.labelText,
      required this.onChanged,
      required this.hintText,
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.errorText = '',
      this.maxLength,
      this.textInputFormatterList,
      this.initialValue = '',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      inputFormatters: textInputFormatterList,
      maxLength: maxLength,
      obscureText: obscureText,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          counterText: '',
          hintText: hintText,
          errorText: errorText.isEmpty ? null : errorText),
      onChanged: (str) => onChanged(str),
      keyboardType: textInputType,
    );
  }
}
