import 'package:flutter/material.dart';

import '../../styles/asklora_colors.dart';
import '../custom_text_new.dart';

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
  final FontWeight fontWeight;
  final BorderSide borderSide;

  const CustomButton(
      {required this.label,
      required this.onClick,
      this.backgroundColor = AskLoraColors.charcoal,
      this.foregroundColor = AskLoraColors.primaryGreen,
      this.borderRadius = 16,
      this.isLoading = false,
      this.disable = false,
      this.height,
      this.width,
      this.padding,
      this.borderSide = BorderSide.none,
      this.margin,
      this.fontStyle = FontStyle.italic,
      this.fontWeight = FontWeight.w900,
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
                  foregroundColor: disable ? Colors.white : foregroundColor,
                  backgroundColor:
                      disable ? AskLoraColors.gray : backgroundColor,
                  shape: RoundedRectangleBorder(
                    side: borderSide,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  minimumSize: const Size.fromHeight(50)),
              child: CustomTextNew(
                label,
                fontSize: 15,
                fontStyle: fontStyle,
                fontWeight: fontWeight,
                color: disable
                    ? AskLoraColors.darkGray
                    : AskLoraColors.primaryGreen,
              ),
            ),
    );
  }
}
