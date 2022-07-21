import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomCountryPicker extends StatelessWidget {
  final String? title;
  final String? initialValue;
  final String hintText;
  final Function(Country) onSelect;
  final bool showPhoneCode;

  const CustomCountryPicker(
      {required this.onSelect,
      this.initialValue,
      this.title,
      this.hintText = 'Select Country',
      this.showPhoneCode = false,
      Key? key})
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
            showPhoneCode: showPhoneCode,
            favorite: ['HK', 'US', 'GB'],
            onSelect: onSelect,
          ),
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1, color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomText(
                    ellipsis: true,
                    initialValue != null && initialValue!.isNotEmpty
                        ? initialValue!
                        : hintText,
                    color: initialValue != null && initialValue!.isNotEmpty
                        ? Colors.black
                        : Colors.grey,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down_circle,
                  color: Colors.lightBlueAccent,
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
