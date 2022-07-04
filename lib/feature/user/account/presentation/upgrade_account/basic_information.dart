import 'package:built_value/built_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_date_picker.dart';
import '../../../../../core/presentation/custom_dropdown.dart';
import '../../../../../core/presentation/custom_phone_number_input.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/question_widget.dart';
import 'upgrade_account_screen.dart';

class BasicInformationForm extends StatelessWidget {
  final PageController controller;
  const BasicInformationForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _firstNameInput(),
              _middleNameInput(),
              _lastNameInput(),
              _chineseNameInput(),
              _selectGender(),
              _datePicker(context),
              _countryCodeAndPhoneNumber(),
              _countryInput(),
              _optionHkResident(),
              _usResidentCheck(),
            ],
          ),
        )),
        _nextButton()
      ],
    );
  }

  Widget _firstNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomTextInput(
          labelText: 'First Name',
          onChanged: (value) => value,
          hintText: 'Enter your first name'),
    );
  }

  Widget _middleNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          labelText: 'Middle Name',
          onChanged: (value) => value,
          hintText: 'Enter your Middle name'),
    );
  }

  Widget _lastNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          labelText: 'Last Name',
          onChanged: (value) => value,
          hintText: 'Enter your Last name'),
    );
  }

  Widget _chineseNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          labelText: 'Chinese Name',
          onChanged: (value) => value,
          hintText: 'Enter your Chinese name'),
    );
  }

  Widget _selectGender() => CustomDropdown(
      label: 'Gender',
      padding: const EdgeInsets.only(top: 10),
      itemsList: const ['Male', 'Female', 'Other'],
      onChanged: (gender) => gender);

  Widget _datePicker(context) => CustomDatePicker(
        padding: const EdgeInsets.only(top: 10),
        label: 'Date of Birth',
        onDateTimeChanged: (date) => date,
      );

  Widget _countryCodeAndPhoneNumber() => CustomPhoneNumberInput(
        onChangedCodeArea: (code) => code,
        onChangePhoneNumber: (phoneNumber) => phoneNumber,
      );

  Widget _countryInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          labelText: 'Country of Citizenship',
          onChanged: (value) => value,
          hintText: 'Enter your Chinese name'),
    );
  }

  Widget _optionHkResident() {
    return QuestionWidget(
        padding: const EdgeInsets.only(top: 10),
        questionText: 'Hong Kong Permanent Resident',
        options: ['Yes', 'No'],
        onSelected: (value) => value);
  }

  Widget _usResidentCheck() {
    return QuestionWidget(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        questionText: 'US Resident Check',
        options: ['Yes', 'No'],
        onSelected: (value) => value);
  }

  Widget _nextButton() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextButton(
          buttonText: 'Next',
          borderRadius: 30,
          onClick: () => '',
        ),
      );
}
