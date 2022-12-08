import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AskLoraTextStyles {
  static TextStyle h1 = GoogleFonts.mulish(textStyle: TextStyle(
      fontSize: 50, height: 1.2, fontWeight: AskLoraFontWeight.black.value));

  static TextStyle h2 = GoogleFonts.mulish(textStyle: TextStyle(
      fontSize: 33, height: 1.32, fontWeight: AskLoraFontWeight.black.value));

  static TextStyle h3 = GoogleFonts.mulish(textStyle: TextStyle(
      fontSize: 28, height: 1.32, fontWeight: AskLoraFontWeight.black.value));

  static TextStyle h3Italic = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 28,
    height: 1.5,
    fontWeight: AskLoraFontWeight.black.value,
    fontStyle: FontStyle.italic,
  ));

  static TextStyle h4 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 23,
    height: 1.32,
    fontWeight: AskLoraFontWeight.black.value,
  ));

  static TextStyle h4Italic = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 23,
    height: 1.32,
    fontWeight: AskLoraFontWeight.black.value,
    fontStyle: FontStyle.italic,
  ));

  static TextStyle h5 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 19,
    height: 1.32,
    fontWeight: AskLoraFontWeight.black.value,
  ));

  static TextStyle h5Italic = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 19,
    height: 1.32,
    fontWeight: AskLoraFontWeight.black.value,
    fontStyle: FontStyle.italic,
  ));

  static TextStyle h6 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 16,
    height: 1.32,
    fontWeight: AskLoraFontWeight.black.value,
  ));

  static TextStyle subtitle1 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 17,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  ));

  static TextStyle subtitle2 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 15,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  ));

  static TextStyle subtitle3 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 13,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  ));

  static TextStyle subtitle4 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 11,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  ));

  static TextStyle subtitle5 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 9,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  ));

  static TextStyle subtitleLight1 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 24,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  ));

  static TextStyle subtitleLight2 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 18,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  ));

  static TextStyle subtitleAllCap1 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 10,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  ));

  static TextStyle subtitleAllCap2 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 8,
    height: 1.5,
    fontWeight: AskLoraFontWeight.bold.value,
  ));

  static TextStyle body1 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 15,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  ));

  static TextStyle body2 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 13,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  ));

  static TextStyle body3 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 11,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  ));

  static TextStyle body4 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 9,
    height: 1.5,
    fontWeight: AskLoraFontWeight.regular.value,
  ));

  static TextStyle button1 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 15,
    height: 1.5,
    fontWeight: AskLoraFontWeight.black.value,
    fontStyle: FontStyle.italic,
  ));

  static TextStyle button2 = GoogleFonts.mulish(textStyle: TextStyle(
    fontSize: 11,
    height: 1.5,
    fontWeight: AskLoraFontWeight.black.value,
    fontStyle: FontStyle.italic,
  ));
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
