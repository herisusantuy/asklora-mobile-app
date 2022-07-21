import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import 'custom_country_picker.dart';
import 'custom_text.dart';
import 'custom_text_input.dart';

class CustomPhoneNumberInput extends StatelessWidget {
  final Function(Country) onChangedCodeArea;
  final Function(String) onChangePhoneNumber;
  final String? initialValue;

  const CustomPhoneNumberInput({
    Key? key,
    this.initialValue,
    required this.onChangedCodeArea,
    required this.onChangePhoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          'Country Code + Phone Number',
          type: FontType.formTitle,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CustomCountryPicker(
                      initialValue:
                          initialValue != null && initialValue!.isNotEmpty
                              ? '+$initialValue'
                              : null,
                      hintText: '+852',
                      onSelect: onChangedCodeArea)),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 2,
                  child: CustomTextInput(
                    hintText: 'Phone Number',
                    labelText: 'Phone Number',
                    onChanged: onChangePhoneNumber,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
