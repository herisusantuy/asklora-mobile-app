import 'package:flutter/material.dart';

abstract class AppValues {
  static const EdgeInsets screenHorizontalPadding =
      EdgeInsets.only(left: 15, right: 15);

  static const BoxDecoration loraBackgroundBoxDecoration = BoxDecoration(
    color: Colors.black,
    image: DecorationImage(
        image: AssetImage('assets/lora_gpt_background.png'), fit: BoxFit.cover),
  );
}
