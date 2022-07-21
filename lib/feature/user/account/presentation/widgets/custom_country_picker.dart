import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';

class CustomCountryPicker extends StatelessWidget {
  final String? title;
  final String? initialValue;
  final Function(Country) onSelect;

  const CustomCountryPicker(
      {required this.onSelect, this.initialValue, this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: CustomText(title!, type: FontType.smallText)),
          ),
        InkWell(
          onTap: () => showCountryPicker(
            context: context,
            showPhoneCode: false,
            favorite: ['HK', 'US', 'GBR'],
            onSelect: onSelect,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1, color: Colors.grey)),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: CustomText(initialValue ?? 'Select Country'),
                ),
                const Icon(
                  Icons.arrow_drop_down_circle,
                  color: Colors.lightBlueAccent,
                  size: 28,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
