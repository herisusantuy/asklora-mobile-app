import 'package:flutter/material.dart';

import '../../../core/presentation/custom_text.dart';
import '../../../core/presentation/custom_text_input.dart';

class CustomPaymentTextInput extends StatelessWidget {
  final Function(String) onChanged;
  final String labelText;
  final String hintText;
  final String initialValue;

  const CustomPaymentTextInput(
      {required this.labelText,
      required this.hintText,
      required this.onChanged,
      this.initialValue = '',
      Key? key})
      : super(key: key);

  InputBorder get customBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide:
            const BorderSide(style: BorderStyle.none, color: Colors.white),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            labelText,
            type: FontType.smallTextBold,
          ),
          const SizedBox(
            height: 6,
          ),
          CustomTextInput(
              initialValue: initialValue,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              inputBorder: customBorder,
              enabledBorder: customBorder,
              focusedBorder: customBorder,
              fillColor: Colors.white,
              labelText: labelText,
              onChanged: onChanged,
              hintText: hintText),
        ],
      ),
    );
  }
}
