import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';
import '../utils/formatters/phone_input_formatter/phone_input_formatter.dart';
import 'clearable_text_field.dart';
import 'custom_country_picker.dart';
import 'custom_text_new.dart';

class CustomPhoneNumberInput extends StatelessWidget {
  static const String defaultSelectedCountryCode = '852';

  final Function(Country) onChangedCodeArea;
  final Function(String) onChangePhoneNumber;
  final String? initialValueOfCodeArea;
  final String? initialValueOfPhoneNumber;
  final String errorText;

  const CustomPhoneNumberInput({
    Key? key,
    this.initialValueOfCodeArea,
    this.initialValueOfPhoneNumber,
    required this.onChangedCodeArea,
    required this.onChangePhoneNumber,
    this.errorText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextNew('Phone Number', style: AskLoraTextStyles.body2),
        const SizedBox(height: 5),
        ClearableTextFormField(
          prefix: const UnconstrainedBox(
            constrainedAxis: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 0, right: 15),
              child: Text(
                '+852',
                style: TextStyle(color: AskLoraColors.charcoal),
              ),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
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
          hintText: 'Input Phone Number',
          labelText: '',
          onChanged: (s) => {},
          errorText: errorText,
        ),
      ],
    );
  }
}
