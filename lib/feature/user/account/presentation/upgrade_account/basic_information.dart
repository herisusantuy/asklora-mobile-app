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
              key: const Key('account_middle_name_input'),
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
              key: const Key('account_last_name_input'),
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
              key: const Key('account_chinese_name_input'),
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
            key: const Key('account_gender_input'),
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
            key: const Key('account_date_of_birth_input'),
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
            key: const Key('account_phone_number_input'),
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
          key: const Key('account_country_of_citizenship_input'),
          labelText: 'Country of Citizenship',
          onChanged: (value) => value,
          hintText: 'Enter your Chinese name'),
    );
  }

  Widget _optionHkResident() {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return QuestionWidget(
          key: const Key('account_is_hongkong_permanent_resident_input'),
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
          key: const Key('account_is_united_state_resident_input'),
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
        child: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            return CustomTextButton(
              buttonText: 'Next',
              borderRadius: 30,
              onClick: () {
                context
                    .read<AccountBloc>()
                    .add(const AccountCurrentStepChanged('next'));
                controller.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.ease);
              },
            );
          },
        ),
      );
}
