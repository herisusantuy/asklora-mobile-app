import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomCheckbox extends StatelessWidget {
  final Key? checkboxKey;
  final EdgeInsets padding;
  final String text;
  final TextAlign textAlign;
  final bool isChecked;
  final bool disabled;
  final void Function(bool?) onChanged;

  const CustomCheckbox({
    Key? key,
    this.checkboxKey,
    required this.text,
    this.padding = EdgeInsets.zero,
    required this.isChecked,
    required this.onChanged,
    this.textAlign = TextAlign.start,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            key: checkboxKey,
            splashRadius: 0,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            value: isChecked,
            onChanged: disabled ? null : onChanged,
          ),
          Expanded(
            child: CustomText(
              text,
              padding: const EdgeInsets.only(top: 5, left: 5),
              textAlign: textAlign,
            ),
          ),
        ],
      ),
    );
  }
}
