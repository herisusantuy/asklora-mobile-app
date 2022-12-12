import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/asklora_colors.dart';
import '../../styles/asklora_text_styles.dart';

class AutoResizedTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final String labelText;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatterList;
  final String hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  const AutoResizedTextField(
      {this.onChanged,
      this.labelText = '',
      this.hintText = '',
      this.initialValue,
      this.controller,
      this.textInputType = TextInputType.text,
      this.textInputFormatterList,
      this.suffixIcon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintStyle: AskLoraTextStyles.h3Italic
              .copyWith(color: AskLoraColors.lightGray),
          suffixIcon: suffixIcon,
          hintText: hintText),
      style: AskLoraTextStyles.h3,
    );
  }
}
