import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';

void showModalTextInput({
  required BuildContext context,
  String labelTextInput = '',
  String hint = '',
  String labelButton = 'Submit',
  bool barrierDismissible = true,
  required void Function(String) onChanged,
  required void Function() onSubmit,
}) =>
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) => AlertDialog(
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 5),
            child: CustomTextInput(
                labelText: labelTextInput,
                onChanged: (str) => onChanged(str),
                hintText: hint),
          ),
          CustomTextButton(buttonText: labelButton, onClick: () => onSubmit())
        ],
      ),
    );
