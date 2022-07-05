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
import '../../bloc/account_bloc.dart';
import 'upgrade_account_screen.dart';

class BasicInformationForm extends StatelessWidget {
  final PageController controller;
  const BasicInformationForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      child: Column(
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
      ),
    );
  }

  Widget _firstNameInput() {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Padding(
          key: const Key('account_first_name_input'),
          padding: const EdgeInsets.only(top: 20),
          child: CustomTextInput(
            labelText: 'First Name',
            hintText: 'Enter your first name',
            onChanged: (value) =>
                context.read<AccountBloc>().add(AccountFirstNameChanged(value)),
          ),
        );
      },
    );
  }

  Widget _middleNameInput() {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CustomTextInput(
              labelText: 'Middle Name',
              onChanged: (value) => context
                  .read<AccountBloc>()
                  .add(AccountMiddleNameChanged(value)),
              hintText: 'Enter your Middle name'),
        );
      },
    );
  }

  Widget _lastNameInput() {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CustomTextInput(
              labelText: 'Last Name',
              onChanged: (value) => context
                  .read<AccountBloc>()
                  .add(AccountLastNameChanged(value)),
              hintText: 'Enter your Last name'),
        );
      },
    );
  }

  Widget _chineseNameInput() {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CustomTextInput(
              labelText: 'Chinese Name',
              onChanged: (value) => context
                  .read<AccountBloc>()
                  .add(AccountChineseNameChanged(value)),
              hintText: 'Enter your Chinese name'),
        );
      },
    );
  }

  Widget _selectGender() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return CustomDropdown(
            label: 'Gender',
            padding: const EdgeInsets.only(top: 10),
            itemsList: const ['Male', 'Female', 'Other'],
            onChanged: (gender) =>
                context.read<AccountBloc>().add(AccountGenderChanged(gender!)),
          );
        },
      );

  Widget _datePicker(context) => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return CustomDatePicker(
            padding: const EdgeInsets.only(top: 10),
            label: 'Date of Birth',
            selectedDate: DateTime.parse(state.dateOfBirth),
            onDateTimeChanged: (date) => context.read<AccountBloc>().add(
                  AccountDateOfBirthChanged(date.toString()),
                ),
          );
        },
      );

  Widget _countryCodeAndPhoneNumber() => BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return CustomPhoneNumberInput(
            onChangedCodeArea: (code) => context
                .read<AccountBloc>()
                .add(AccountCountryCodeChanged(code)),
            onChangePhoneNumber: (phoneNumber) => context
                .read<AccountBloc>()
                .add(AccountPhoneNumberChanged(phoneNumber)),
          );
        },
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
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return QuestionWidget(
          padding: const EdgeInsets.only(top: 10),
          questionText: 'Hong Kong Permanent Resident',
          options: ['Yes', 'No'],
          selectedAnswer: state.isHongkongPermanentResident ? 'Yes' : 'No',
          onSelected: (value) => context.read<AccountBloc>().add(
              AccountIsHongKongPermanentResidentChanged(
                  value == 'Yes' ? true : false)),
        );
      },
    );
  }

  Widget _usResidentCheck() {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return QuestionWidget(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          questionText: 'US Resident Check',
          options: ['Yes', 'No'],
          selectedAnswer: state.isUnitedStateResident ? 'Yes' : 'No',
          onSelected: (value) => context.read<AccountBloc>().add(
              AccountIsUnitedStateResidentChanged(
                  value == 'Yes' ? true : false)),
        );
      },
    );
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
