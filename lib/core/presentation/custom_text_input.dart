import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String errorText;
  final bool obscureText;
  final TextInputType textInputType;
  final Function(String) onChanged;

  const CustomTextInput(
      {required this.labelText,
      required this.onChanged,
      required this.hintText,
      this.textInputType = TextInputType.text,
      this.obscureText = false,
      this.errorText = '',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          hintText: hintText,
          errorText: errorText.isEmpty ? null : errorText),
      onChanged: (str) => onChanged(str),
      keyboardType: textInputType,
    );
  }
}
