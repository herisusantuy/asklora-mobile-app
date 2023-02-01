import 'package:flutter/material.dart';

import '../../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../../core/utils/extensions.dart';
import '../../../../../../../core/utils/money_masked_text_controller.dart';

part 'pads/custom_key_pad_button.dart';

part 'pads/custom_delete_key_pad.dart';

class CustomKeyPad extends StatefulWidget {
  final Function(double) onChanged;

  const CustomKeyPad({required this.onChanged, Key? key}) : super(key: key);

  @override
  State<CustomKeyPad> createState() => _CustomKeyPadState();
}

class _CustomKeyPadState extends State<CustomKeyPad> {
  final MoneyMaskedTextController controller = MoneyMaskedTextController(
      thousandSeparator: ',', decimalSeparator: '.', precision: 1);
  final double _spacing = 5;
  final double _runSpacing = 7;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      widget
          .onChanged(double.parse(controller.text.replaceAll(amountRegex, '')));
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double padWidth = (constraints.maxWidth - _spacing * 2) / 3;
      final double padHeight = (constraints.maxHeight - _runSpacing * 3) / 4;
      return Wrap(
        spacing: _spacing,
        runSpacing: _runSpacing,
        children: [
          CustomKeyPadButton(
              height: padHeight,
              controller: controller,
              value: '1',
              width: padWidth),
          CustomKeyPadButton(
              height: padHeight,
              controller: controller,
              value: '2',
              width: padWidth),
          CustomKeyPadButton(
              height: padHeight,
              controller: controller,
              value: '3',
              width: padWidth),
          CustomKeyPadButton(
              height: padHeight,
              controller: controller,
              value: '4',
              width: padWidth),
          CustomKeyPadButton(
              height: padHeight,
              controller: controller,
              value: '5',
              width: padWidth),
          CustomKeyPadButton(
              height: padHeight,
              controller: controller,
              value: '6',
              width: padWidth),
          CustomKeyPadButton(
              height: padHeight,
              controller: controller,
              value: '7',
              width: padWidth),
          CustomKeyPadButton(
              height: padHeight,
              controller: controller,
              value: '8',
              width: padWidth),
          CustomKeyPadButton(
              height: padHeight,
              controller: controller,
              value: '9',
              width: padWidth),
          _emptyKeyPad(width: padWidth, height: padHeight),
          CustomKeyPadButton(
              height: padHeight,
              controller: controller,
              value: '0',
              width: padWidth),
          CustomDeleteKeyPad(
              height: padHeight, controller: controller, width: padWidth)
        ],
      );
    });
  }

  Widget _emptyKeyPad({required double width, required double height}) =>
      SizedBox(
        height: height,
        width: width,
      );
}
