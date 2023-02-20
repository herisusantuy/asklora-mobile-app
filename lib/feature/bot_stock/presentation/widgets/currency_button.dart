import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_new.dart';

class CurrencyButton extends StatelessWidget {
  final List<String> items;
  final void Function(String?) onChanged;
  final String initialValue;
  const CurrencyButton({
    Key? key,
    required this.items,
    required this.onChanged,
    this.initialValue = '',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: DropdownButtonFormField(
          value: initialValue.isNotEmpty ? initialValue : null,
          elevation: 2,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, size: 20),
          decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero),
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: CustomTextNew(
                      item,
                      style: const TextStyle(
                          fontSize: 9, fontWeight: FontWeight.w700),
                    ),
                  ))
              .toList(),
          onChanged: (String? newValue) {
            onChanged(newValue);
          }),
    );
  }
}
