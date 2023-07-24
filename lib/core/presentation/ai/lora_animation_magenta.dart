import 'package:flutter/material.dart';

class LoraAnimationMagenta extends StatelessWidget {
  const LoraAnimationMagenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/apng/lora_animation_green.png',
        height: 200, width: 200, filterQuality: FilterQuality.high);
  }
}
