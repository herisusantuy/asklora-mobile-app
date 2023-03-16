import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/asklora_colors.dart';
import '../../styles/asklora_text_styles.dart';

class AutoResizedTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String labelText;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatterList;
  final String hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;

  const AutoResizedTextField(
      {this.onChanged,
      this.onFieldSubmitted,
      this.labelText = '',
      this.hintText = '',
      this.initialValue,
      this.controller,
      this.textInputType = TextInputType.text,
      this.textInputFormatterList,
      this.suffixIcon,
      this.prefixIcon,
      this.textStyle,
      this.hintTextStyle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: textInputType,
      inputFormatters: textInputFormatterList,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          hintStyle: hintTextStyle ??
              AskLoraTextStyles.h3Italic
                  .copyWith(color: AskLoraColors.lightGray),
          suffixIcon: suffixIcon,
          hintText: hintText),
      style: textStyle ?? AskLoraTextStyles.h3,
    );
  }
}
