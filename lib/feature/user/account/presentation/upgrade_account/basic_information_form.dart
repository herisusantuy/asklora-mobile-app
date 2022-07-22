import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_country_picker.dart';
import '../../../../../core/presentation/custom_date_picker.dart';
import '../../../../../core/presentation/custom_dropdown.dart';
import '../../../../../core/presentation/custom_phone_number_input.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/question_widget.dart';
import '../../../../../core/utils/formatters/upper_case_text_formatter.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/basic_information/bloc/basic_information_bloc.dart';
import 'not_eligible_screen.dart';

class BasicInformationForm extends StatelessWidget {
  final PageController controller;

  final _scrollController = ScrollController();

  BasicInformationForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _firstNameInput(context),
              _middleNameInput(context),
              _lastNameInput(context),
              _chineseNameInput(context),
              _selectGender(context),
              _datePicker(),
              _countryCodeAndPhoneNumber(context),
              _countryOfCitizenship(context),
              _optionHkResident(),
              _usResidentCheck(),
            ],
          ),
        )),
        _nextButton(context)
      ],
    );
  }

  Widget _firstNameInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomTextInput(
        key: const Key('account_first_name_input'),
        labelText: 'First Name',
        hintText: 'Enter your first name',
        onChanged: (value) => context
            .read<BasicInformationBloc>()
            .add(BasicInformationFirstNameChanged(value)),
      ),
    );
  }

  Widget _middleNameInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          key: const Key('account_middle_name_input'),
          labelText: 'Middle Name (Optional)',
          onChanged: (value) => context
              .read<BasicInformationBloc>()
              .add(BasicInformationMiddleNameChanged(value)),
          hintText: 'Enter your Middle name (Optional)'),
    );
  }

  Widget _lastNameInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          key: const Key('account_last_name_input'),
          labelText: 'Last Name',
          onChanged: (value) => context
              .read<BasicInformationBloc>()
              .add(BasicInformationLastNameChanged(value)),
          hintText: 'Enter your Last name'),
    );
  }

  Widget _chineseNameInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          key: const Key('account_chinese_name_input'),
          labelText: 'Chinese Name (Optional)',
          onChanged: (value) => context
              .read<BasicInformationBloc>()
              .add(BasicInformationChineseNameChanged(value)),
          hintText: 'Enter your Chinese name (Optional)'),
    );
  }

  Widget _selectGender(BuildContext context) => CustomDropdown(
        key: const Key('account_gender_select'),
        label: 'Gender',
        padding: const EdgeInsets.only(top: 10),
        itemsList: const ['Male', 'Female', 'Other'],
        onChanged: (gender) => context
            .read<BasicInformationBloc>()
            .add(BasicInformationGenderChanged(gender!)),
      );

  Widget _datePicker() =>
      BlocBuilder<BasicInformationBloc, BasicInformationState>(
        buildWhen: ((previous, current) =>
            previous.dateOfBirth != current.dateOfBirth),
        builder: (context, state) {
          final DateTime dateTime = DateTime.now();
          return CustomDatePicker(
            key: const Key('account_date_of_birth_picker'),
            padding: const EdgeInsets.only(top: 10),
            label: 'Date of Birth',
            selectedDate: DateTime.parse(state.dateOfBirth),
            initialDateTime:
                DateTime(dateTime.year - 18, dateTime.month, dateTime.day),
            maximumYear: dateTime.year - 18,
            onDateTimeChanged: (date) =>
                context.read<BasicInformationBloc>().add(
                      BasicInformationDateOfBirthChanged(date.toString()),
                    ),
          );
        },
      );

  Widget _countryCodeAndPhoneNumber(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: BlocBuilder<BasicInformationBloc, BasicInformationState>(
            builder: (context, state) => CustomPhoneNumberInput(
                  key: const Key('account_country_code_phone_number_input'),
                  initialValue: state.countryCode,
                  onChangedCodeArea: (country) => context
                      .read<BasicInformationBloc>()
                      .add(BasicInformationCountryCodeChanged(
                          country.phoneCode)),
                  onChangePhoneNumber: (phoneNumber) => context
                      .read<BasicInformationBloc>()
                      .add(BasicInformationPhoneNumberChanged(phoneNumber)),
                )),
      );

  Widget _countryOfCitizenship(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 20),
      child: BlocBuilder<BasicInformationBloc, BasicInformationState>(
        builder: (context, state) => CustomCountryPicker(
          key: const Key('account_country_of_citizenship_input'),
          title: 'Country of Tax Residence',
          initialValue: state.countryNameOfCitizenship,
          onSelect: (Country country) => context
              .read<BasicInformationBloc>()
              .add(BasicInformationCountryOfCitizenshipChanged(
                  country.countryCodeIso3, country.name)),
        ),
      ));

  Widget _optionHkResident() {
    return BlocBuilder<BasicInformationBloc, BasicInformationState>(
      buildWhen: ((previous, current) =>
          previous.isHongKongPermanentResident !=
          current.isHongKongPermanentResident),
      builder: (context, state) {
        const String key = 'account_is_hong_kong_permanent_resident_question';
        return Column(
          children: [
            QuestionWidget(
              keyOption: key,
              key: const Key(key),
              padding: const EdgeInsets.only(top: 10),
              questionText: 'Hong Kong Permanent Resident',
              options: const ['Yes', 'No'],
              selectedAnswer: state.isHongKongPermanentResident != null
                  ? (state.isHongKongPermanentResident! ? 'Yes' : 'No')
                  : null,
              onSelected: (value) async {
                context.read<BasicInformationBloc>().add(
                    BasicInformationIsHongKongPermanentResidentChanged(
                        value == 'Yes' ? true : false));
                if (value == 'No') {
                  context
                      .read<BasicInformationBloc>()
                      .add(const BasicInformationIdNumberChanged(''));
                } else {
                  Future.delayed(
                      const Duration(milliseconds: 200),
                      () => _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          ));
                }
              },
            ),
            if (state.isHongKongPermanentResident != null &&
                state.isHongKongPermanentResident!)
              _idNumberInput(context),
          ],
        );
      },
    );
  }

  Widget _idNumberInput(BuildContext context) {
    return BlocBuilder<BasicInformationBloc, BasicInformationState>(
      buildWhen: (previous, current) => previous.idNumber != current.idNumber,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CustomTextInput(
              key: const Key('account_id_number_input'),
              labelText: 'ID Number *',
              textInputFormatterList: [UpperCaseTextFormatter()],
              errorText: state.isHkIdValid ? '' : 'HKID is not valid.',
              maxLength: 9,
              initialValue: state.idNumber,
              onChanged: (value) => context
                  .read<BasicInformationBloc>()
                  .add(BasicInformationIdNumberChanged(value)),
              hintText: 'Enter your ID number'),
        );
      },
    );
  }

  Widget _usResidentCheck() {
    return BlocBuilder<BasicInformationBloc, BasicInformationState>(
      buildWhen: ((previous, current) =>
          previous.isUnitedStateResident != current.isUnitedStateResident),
      builder: (context, state) {
        String key = 'account_is_united_state_resident_question';
        return Column(
          children: [
            QuestionWidget(
              keyOption: key,
              key: Key(key),
              padding: const EdgeInsets.only(top: 10),
              questionText: 'US Resident Check',
              options: const ['Yes', 'No'],
              selectedAnswer: state.isUnitedStateResident != null
                  ? (state.isUnitedStateResident! ? 'Yes' : 'No')
                  : null,
              onSelected: (value) => context.read<BasicInformationBloc>().add(
                  BasicInformationIsUnitedStateResidentChanged(
                      value == 'Yes' ? true : false)),
            ),
            if (state.isUnitedStateResident != null &&
                state.isUnitedStateResident!)
              _usResidentsNote()
          ],
        );
      },
    );
  }

  Widget _usResidentsNote() {
    return Container(
      key: const Key('account_us_resident_note'),
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomText(
            '*',
            type: FontType.smallNote,
          ),
          Expanded(
            child: CustomText(
              'I am a US tax resident, green card holder, or US citizen',
              type: FontType.smallNote,
            ),
          ),
        ],
      ),
    );
  }

  Widget _nextButton(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: BlocBuilder<BasicInformationBloc, BasicInformationState>(
          buildWhen: (previous, current) =>
              previous.enableNextButton() != current.enableNextButton() ||
              previous.isHongKongPermanentResident !=
                  current.isHongKongPermanentResident,
          builder: (context, state) {
            return CustomTextButton(
              key: const Key('account_basic_information_next_step_button'),
              buttonText: 'Next',
              borderRadius: 30,
              disable: !state.enableNextButton(),
              onClick: () {
                if (state.isHongKongPermanentResident != null &&
                    !state.isHongKongPermanentResident!) {
                  NotEligibleScreen.openReplace(context);
                } else {
                  context
                      .read<AccountBloc>()
                      .add(const AccountCurrentStepChanged('next'));
                  controller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                }
              },
            );
          },
        ),
      );
}
