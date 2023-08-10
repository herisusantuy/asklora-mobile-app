import 'package:flutter/material.dart';

class LoraAnimationGreen extends StatelessWidget {
  final double height;
  final double width;
  const LoraAnimationGreen({this.height = 170, this.width = 170, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/videos/lora_animation_green.webp',
        height: height, width: width, filterQuality: FilterQuality.high);
  }
}
