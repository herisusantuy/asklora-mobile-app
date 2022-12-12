import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../styles/asklora_colors.dart';
import 'custom_text.dart';
import 'custom_text_new.dart';
import 'text_fields/style/text_field_style.dart';

class CustomCountryPicker extends StatelessWidget {
  final String? title;
  final String? initialValue;
  final String hintText;
  final Function(Country) onSelect;
  final bool showPhoneCode;
  final double height;

  const CustomCountryPicker(
      {required this.onSelect,
      this.initialValue,
      this.title,
      this.hintText = 'Select Country',
      this.showPhoneCode = false,
      this.height = 60,
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
            favorite: ['HK', 'US', 'CA', 'GB'],
            onSelect: onSelect,
          ),
          child: Container(
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextNew(
                    ellipsis: true,
                    initialValue != null && initialValue!.isNotEmpty
                        ? initialValue!
                        : hintText,
                    style: TextFieldStyle.valueTextStyle.copyWith(
                        height: 1,
                        color: initialValue != null && initialValue!.isNotEmpty
                            ? AskLoraColors.charcoal
                            : AskLoraColors.gray),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AskLoraColors.charcoal,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
