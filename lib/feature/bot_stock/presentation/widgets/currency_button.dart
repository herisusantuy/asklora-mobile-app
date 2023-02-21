import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/currency_enum.dart';

class CurrencyButton extends StatelessWidget {
  final void Function(CurrencyType?) onChanged;
  final CurrencyType? initialValue;
  const CurrencyButton({
    Key? key,
    required this.onChanged,
    this.initialValue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: DropdownButtonFormField(
          value: initialValue,
          elevation: 2,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, size: 20),
          decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero),
          items: CurrencyType.values
              .map((item) => DropdownMenuItem<CurrencyType>(
                    value: item,
                    child: CustomTextNew(
                      item.value,
                      style: AskLoraTextStyles.body4,
                    ),
                  ))
              .toList(),
          onChanged: (CurrencyType? newValue) {
            onChanged(newValue);
          }),
    );
  }
}
