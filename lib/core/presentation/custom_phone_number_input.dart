import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_country_picker.dart';
import 'custom_text.dart';
import 'custom_text_input.dart';

class CustomPhoneNumberInput extends StatelessWidget {
  final Function(Country) onChangedCodeArea;
  final Function(String) onChangePhoneNumber;
  final String? initialValueOfCodeArea;
  final String? initialValueOfPhoneNumber;

  const CustomPhoneNumberInput({
    Key? key,
    this.initialValueOfCodeArea,
    this.initialValueOfPhoneNumber,
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
                      initialValue: initialValueOfCodeArea != null &&
                              initialValueOfCodeArea!.isNotEmpty
                          ? '+$initialValueOfCodeArea'
                          : null,
                      hintText: '+852',
                      onSelect: onChangedCodeArea)),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 2,
                  child: CustomTextInput(
                    initialValue: initialValueOfPhoneNumber ?? '',
                    textInputType: TextInputType.number,
                    textInputFormatterList: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
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
