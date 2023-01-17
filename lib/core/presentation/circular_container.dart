import 'package:flutter/material.dart';

import '../styles/asklora_colors.dart';

class CircularContainer extends StatelessWidget {
  final Color backgroundColor;
  final double height;
  final double width;
  final Widget child;

  const CircularContainer(
      {super.key,
      this.backgroundColor = AskLoraColors.lightGray,
      this.height = 73,
      this.width = 73,
      required this.child});

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
        child: Align(alignment: Alignment.center, child: child),
      );
}
