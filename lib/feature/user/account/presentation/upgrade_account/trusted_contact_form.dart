import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';

class TrustedContactForm extends StatelessWidget {
  final PageController controller;
  const TrustedContactForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _firstNameInput(),
              _lastNameInput(),
              _emailInput(),
              _phoneNumberInput(),
            ],
          ),
        ),
        _nextButton()
      ],
    );
  }

  Widget _firstNameInput() => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CustomTextInput(
          labelText: 'First Name',
          onChanged: (value) => value,
          hintText: 'Enter First Name',
        ),
      );
  Widget _lastNameInput() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextInput(
          labelText: 'Last Name',
          onChanged: (value) => value,
          hintText: 'Enter Last Name',
        ),
      );
  Widget _emailInput() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextInput(
          labelText: 'Email Address',
          onChanged: (value) => value,
          hintText: 'Enter Email Address',
        ),
      );
  Widget _phoneNumberInput() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextInput(
          labelText: 'Phone Number',
          onChanged: (value) => value,
          hintText: 'Enter Phone Number',
        ),
      );

  Widget _nextButton() => CustomTextButton(
        borderRadius: 30,
        buttonText: 'Next',
        onClick: () {},
      );
}
