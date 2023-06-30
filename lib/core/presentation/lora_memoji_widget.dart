import 'package:flutter/material.dart';

import '../UtilTest/app_icons.dart';

enum LoraMemojiType {
  lora1('lora_memoji_1'),
  lora2('lora_memoji_2'),
  lora3('lora_memoji_3'),
  lora4('lora_memoji_4'),
  lora5('lora_memoji_5'),
  lora6('lora_memoji_6'),
  lora7('lora_memoji_7'),
  lora8('lora_memoji_8'),
  lora9('lora_memoji_9'),
  lora10('lora_memoji_10');

  final String value;

  const LoraMemojiType(this.value);
}

class LoraMemojiWidget extends StatelessWidget {
  final LoraMemojiType loraMemojiType;
  final double? height;
  final double? width;
  final Color? color;

  const LoraMemojiWidget(
      {super.key = const Key('lora_memoji_widget'),
      required this.loraMemojiType,
      this.height,
      this.width,
      this.color});

  @override
  Widget build(BuildContext context) {
    return getPngImage(loraMemojiType.value,
        height: height, width: width, color: color);
  }
}
