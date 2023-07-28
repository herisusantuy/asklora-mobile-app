import 'package:flutter/material.dart';

class LoraAnimationMagenta extends StatelessWidget {
  const LoraAnimationMagenta({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/apng/lora_animation_magenta.png',
        height: 170, width: 170, filterQuality: FilterQuality.high);
  }
}
