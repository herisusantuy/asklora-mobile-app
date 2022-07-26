import 'package:flutter/material.dart';
import '../../../../core/presentation/custom_text_button.dart';

class WithdrawalSubmitButton extends StatelessWidget {
  final bool disable;
  final Function onSubmit;

  const WithdrawalSubmitButton(
      {required this.onSubmit, this.disable = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: CustomTextButton(
        height: 40,
        disable: disable,
        buttonText: 'Next',
        onClick: onSubmit,
        primaryColor: Colors.black,
        borderRadius: 6,
      ),
    );
  }
}
