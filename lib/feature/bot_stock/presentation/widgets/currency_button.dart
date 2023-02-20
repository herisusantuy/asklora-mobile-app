import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/currency_enum.dart';

class CurrencyButton extends StatelessWidget {
  final void Function(String?) onChanged;
  const CurrencyButton({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: DropdownButtonFormField(
          value: CurrencyType.hkd.value,
          elevation: 2,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, size: 20),
          decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero),
          items: CurrencyType.values
              .map((item) => DropdownMenuItem<String>(
                    value: item.value,
                    child: CustomTextNew(
                      item.value,
                      style: AskLoraTextStyles.body4,
                    ),
                  ))
              .toList(),
          onChanged: (String? newValue) {
            onChanged(newValue);
          }),
    );
  }
}
