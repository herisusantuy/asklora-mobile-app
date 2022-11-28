import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/formatters/phone_input_formatter/phone_input_formatter.dart';
import 'clearable_text_field.dart';
import 'custom_country_picker.dart';
import 'custom_text.dart';

class CustomPhoneNumberInput extends StatelessWidget {
  static const String defaultSelectedCountryCode = '852';

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
                      hintText: '',
                      showPhoneCode: true,
                      onSelect: onChangedCodeArea,
                  height: 48,
                  )),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 2,
                  child: ClearableTextFormField(

                    initialValue: initialValueOfPhoneNumber ?? '',
                    textInputType: TextInputType.number,
                    textInputFormatterList: [
                      FilteringTextInputFormatter.digitsOnly,
                      PhoneInputFormatter(
                        onPhoneNumberChange: (s) => onChangePhoneNumber(s),
                        countryCode: initialValueOfCodeArea == null ||
                                initialValueOfCodeArea!.isEmpty
                            ? '852'
                            : initialValueOfCodeArea,
                      )
                    ],
                    onClear: () => onChangePhoneNumber(''),
                    hintText: 'Phone Number',
                    labelText: 'Phone Number',
                    onChanged: (s) => {},
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
