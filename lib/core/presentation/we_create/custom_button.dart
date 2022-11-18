import 'package:flutter/material.dart';

import '../custom_text.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final bool disable;
  final String label;
  final Function onClick;
  final Color backgroundColor;
  final Color foregroundColor;
  final double borderRadius;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final FontStyle fontStyle;
  final FontType fontType;
  final FontWeight fontWeight;
  final BorderSide borderSide;

  const CustomButton(
      {required this.label,
      required this.onClick,
      this.backgroundColor = const Color(0xff232323),
      this.foregroundColor = const Color(0xff00e2a1),
      this.borderRadius = 16,
      this.isLoading = false,
      this.disable = false,
      this.height,
      this.width,
      this.padding,
      this.borderSide = BorderSide.none,
      this.margin,
      this.fontStyle = FontStyle.italic,
      this.fontWeight = FontWeight.w700,
      this.fontType = FontType.smallTextBold,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      constraints: const BoxConstraints(minHeight: 55, minWidth: 55),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ElevatedButton(
              onPressed: () => disable ? null : onClick(),
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: disable ? Colors.white70 : foregroundColor,
                  backgroundColor: disable ? Colors.black12 : backgroundColor,
                  shape: RoundedRectangleBorder(
                    side: borderSide,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  minimumSize: const Size.fromHeight(50)),
              child: CustomText(
                label,
                type: fontType,
                fontStyle: fontStyle,
              ),
            ),
    );
  }
}
