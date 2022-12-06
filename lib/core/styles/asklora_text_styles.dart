import 'package:flutter/material.dart';

class AskLoraTextStyles {
  static TextStyle h1 = TextStyle(
      fontSize: 50, height: 1.2, fontWeight: AskLoraFontWeight.black.value);

  static TextStyle h2 = TextStyle(
      fontSize: 33, height: 1.32, fontWeight: AskLoraFontWeight.black.value);

  static TextStyle h3Italic = TextStyle(
    fontSize: 28,
    height: 1.5,
    fontWeight: AskLoraFontWeight.black.value,
    fontStyle: FontStyle.italic,
  );

  static TextStyle h4 = TextStyle(
    fontSize: 23,
    height: 1.32,
    fontWeight: AskLoraFontWeight.black.value,
  );

  static TextStyle h4Italic = TextStyle(
    fontSize: 23,
    height: 1.32,
    fontWeight: AskLoraFontWeight.black.value,
    fontStyle: FontStyle.italic,
  );

  static TextStyle h5 = TextStyle(
    fontSize: 19,
    height: 1.32,
    fontWeight: AskLoraFontWeight.black.value,
  );

  static TextStyle h5Italic = TextStyle(
    fontSize: 19,
    height: 1.32,
    fontWeight: AskLoraFontWeight.black.value,
    fontStyle: FontStyle.italic,
  );

  static TextStyle h6 = TextStyle(
    fontSize: 16,
    height: 1.32,
    fontWeight: AskLoraFontWeight.black.value,
  );

  static TextStyle subtitle1 = TextStyle(
    fontSize: 17,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  );

  static TextStyle subtitle2 = TextStyle(
    fontSize: 15,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  );

  static TextStyle subtitle3 = TextStyle(
    fontSize: 13,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  );

  static TextStyle subtitle4 = TextStyle(
    fontSize: 11,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  );

  static TextStyle subtitle5 = TextStyle(
    fontSize: 9,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  );

  static TextStyle subtitleLight1 = TextStyle(
    fontSize: 24,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  );

  static TextStyle subtitleLight2 = TextStyle(
    fontSize: 18,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  );

  static TextStyle subtitleAllCap1 = TextStyle(
    fontSize: 10,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  );

  static TextStyle subtitleAllCap2 = TextStyle(
    fontSize: 8,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  );

  static TextStyle body1 = TextStyle(
    fontSize: 15,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  );

  static TextStyle body2 = TextStyle(
    fontSize: 13,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  );

  static TextStyle body3 = TextStyle(
    fontSize: 11,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  );

  static TextStyle body4 = TextStyle(
    fontSize: 9,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  );

  static TextStyle? button1 = TextStyle(
    fontSize: 15,
    height: 1.5,
    fontWeight: AskLoraFontWeight.black.value,
    fontStyle: FontStyle.italic,
  );

  static TextStyle button2 = TextStyle(
    fontSize: 11,
    height: 1.5,
    fontWeight: AskLoraFontWeight.black.value,
    fontStyle: FontStyle.italic,
  );
}

enum AskLoraFontWeight {
  thin(FontWeight.w100),
  extraLight(FontWeight.w200),
  light(FontWeight.w300),
  regular(FontWeight.w400),
  medium(FontWeight.w500),
  semiBold(FontWeight.w600),
  bold(FontWeight.w700),
  extraBold(FontWeight.w800),
  black(FontWeight.w900);

  final FontWeight value;

  const AskLoraFontWeight(this.value);
}
