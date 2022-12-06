import 'package:flutter/material.dart';

import '../../../styles/asklora_colors.dart';

class TextFieldStyle {
  static OutlineInputBorder nonFocusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)));

  static OutlineInputBorder focusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AskLoraColors.green, width: 2));

  static TextStyle errorTextStyle =
      const TextStyle(color: AskLoraColors.magenta);

  static TextStyle labelTextStyle = const TextStyle(color: Colors.black);

  static TextStyle hintTextStyle =
      const TextStyle(color: AskLoraColors.darkGray);

  static EdgeInsets contentPadding =
      const EdgeInsets.symmetric(horizontal: 17, vertical: 14);

  static InputDecoration inputDecoration = InputDecoration(
    contentPadding: contentPadding,
    border: nonFocusedBorder,
    focusedBorder: focusedBorder,
    errorBorder: nonFocusedBorder,
    focusedErrorBorder: focusedBorder,
    errorStyle: errorTextStyle,
    labelStyle: labelTextStyle,
    hintStyle: hintTextStyle,
  );
}
