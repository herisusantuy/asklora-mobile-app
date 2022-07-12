import 'package:flutter/material.dart';

import 'custom_text.dart';
import 'custom_text_input.dart';

class CustomPhoneNumberInput extends StatelessWidget {
  final Function(String) onChangedCodeArea;
  final Function(String) onChangePhoneNumber;
  const CustomPhoneNumberInput({
    Key? key,
    required this.onChangedCodeArea,
    required this.onChangePhoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
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
                  child: CustomTextInput(
                      labelText: '',
                      onChanged: onChangedCodeArea,
                      hintText: '+62'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: CustomTextInput(
                      labelText: '',
                      onChanged: onChangePhoneNumber,
                      hintText: 'Phone Number'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
