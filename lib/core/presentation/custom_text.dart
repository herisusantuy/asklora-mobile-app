import 'package:flutter/material.dart';

import '../styles/color.dart';

enum FontType {
  highlight,
  h1,
  h2,
  h3,
  h4,
  h5,
  bodyText,
  bodyTextBold,
  smallText,
  smallTextBold,
  button,
  note,
  smallNote,
  formTitle,
  formInfield,
  mobileMenu,
  delay
}

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontType type;
  final bool ellipsis;
  final TextAlign textAlign;
  final TextDecoration decoration;
  final EdgeInsets padding;
  final int? maxLines;

  const CustomText(
    this.text, {
    Key? key,
    this.color,
    this.type = FontType.bodyText,
    this.ellipsis = false,
    this.textAlign = TextAlign.start,
    this.decoration = TextDecoration.none,
    this.padding = EdgeInsets.zero,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? fontType;

    switch (type) {
      case FontType.h1:
        fontType = 40;
        break;
      case FontType.highlight:
        fontType = 32;
        break;
      case FontType.h2:
        fontType = 30;
        break;
      case FontType.h3:
        fontType = 22;
        break;
      case FontType.h4:
        fontType = 20;
        break;
      case FontType.h5:
        fontType = 18;
        break;
      case FontType.bodyText:
        fontType = 16;
        break;
      case FontType.bodyTextBold:
        fontType = 16;
        break;
      case FontType.smallText:
        fontType = 14;
        break;
      case FontType.smallTextBold:
        fontType = 14;
        break;
      case FontType.button:
        fontType = 14;
        break;
      case FontType.note:
        fontType = 13;
        break;
      case FontType.smallNote:
        fontType = 12;
        break;
      case FontType.formTitle:
        fontType = 14;
        break;
      case FontType.formInfield:
        fontType = 16;
        break;
      case FontType.mobileMenu:
        fontType = 11;
        break;
      case FontType.delay:
        fontType = 11;
        break;
      default:
        fontType = 16;
    }

    FontWeight? boldText;
    switch (type) {
      case FontType.highlight:
        boldText = FontWeight.w300;
        break;
      case FontType.h1:
        boldText = FontWeight.bold;
        break;
      case FontType.h2:
        boldText = FontWeight.bold;
        break;
      case FontType.h3:
        boldText = FontWeight.bold;
        break;
      case FontType.h4:
        boldText = FontWeight.bold;
        break;
      case FontType.h5:
        boldText = FontWeight.bold;
        break;
      case FontType.bodyTextBold:
        boldText = FontWeight.bold;
        break;
      case FontType.smallTextBold:
        boldText = FontWeight.bold;
        break;
      default:
        boldText = FontWeight.normal;
    }
    return Container(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontType,
          fontWeight: boldText,
          decoration: decoration,
        ),
        overflow: ellipsis ? TextOverflow.ellipsis : null,
        textAlign: textAlign,
        maxLines: maxLines,
      ),
    );
  }
}
