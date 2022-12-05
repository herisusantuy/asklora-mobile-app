import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/asklora_colors.dart';

class CustomTextNew extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final double fontSize;
  final double? lineHeight;
  final TextAlign textAlign;
  final int? maxLines;

  const CustomTextNew(this.text,
      {this.color = AskLoraColors.charcoal,
      this.fontSize = 38,
      this.textAlign = TextAlign.start,
      this.fontWeight = FontWeight.w300,
      this.lineHeight,
      this.fontStyle = FontStyle.normal,
      this.maxLines = 10,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.mulish(
        fontSize: fontSize,
        color: color,
        height: lineHeight,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
    );
  }
}
