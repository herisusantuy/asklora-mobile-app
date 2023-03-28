import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';
import '../utils/formatters/phone_input_formatter/phone_input_formatter.dart';
import 'clearable_text_field.dart';
import 'custom_text.dart';
import 'custom_text_new.dart';

class CustomPhoneNumberInput extends StatelessWidget {
  static const String defaultSelectedCountryCode = '852';

  final Function(String) onChangePhoneNumber;
  final String? initialValueOfPhoneNumber;
  final String errorText;

  const CustomPhoneNumberInput({
    Key? key,
    this.initialValueOfPhoneNumber,
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
          prefix: UnconstrainedBox(
            constrainedAxis: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 2),
              child: Text(
                '+852',
                style: AskLoraTextStyles.body1
                    .copyWith(color: AskLoraColors.charcoal),
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
              countryCode: '852',
            )
          ],
          onClear: () => onChangePhoneNumber(''),
          hintText: 'Input Phone Number',
          labelText: '',
          onChanged: (s) => {},
        ),
        if (errorText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: CustomTextNew(errorText,
                style: AskLoraTextStyles.body3.copyWith(
                  color: AskLoraColors.primaryMagenta,
                )),
          ),
      ],
    );
  }
}
