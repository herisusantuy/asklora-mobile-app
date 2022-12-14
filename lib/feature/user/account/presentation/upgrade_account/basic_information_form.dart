import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/presentation/alert_dialog.dart';
import '../../../../../core/presentation/custom_country_picker.dart';
import '../../../../../core/presentation/custom_date_picker.dart';
import '../../../../../core/presentation/custom_dropdown.dart';
import '../../../../../core/presentation/custom_phone_number_input.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/presentation/question_widget.dart';
import '../../../../../core/utils/formatters/custom_formatters.dart';
import '../../../../../core/utils/formatters/upper_case_text_formatter.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/basic_information/bloc/basic_information_bloc.dart';
import 'widgets/upgrade_account_button.dart';

class BasicInformationForm extends StatelessWidget {
  final _scrollController = ScrollController();

  BasicInformationForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BasicInformationState basicInformationState =
        context.read<BasicInformationBloc>().state;
    return Column(
      children: [
        Expanded(
            child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _firstNameInput(context, basicInformationState),
              _middleNameInput(context, basicInformationState),
              _lastNameInput(context, basicInformationState),
              _chineseNameInput(context, basicInformationState),
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

  Widget _firstNameInput(
      BuildContext context, BasicInformationState basicInformationState) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomTextInput(
        textCapitalization: TextCapitalization.words,
        initialValue: basicInformationState.firstName,
        textInputFormatterList: [fullEnglishNameFormatter()],
        key: const Key('account_first_name_input'),
        labelText: 'Legal First Name (English)',
        textInputType: TextInputType.text,
        onChanged: (value) => context
            .read<BasicInformationBloc>()
            .add(BasicInformationFirstNameChanged(value)),
      ),
    );
  }

  Widget _middleNameInput(
      BuildContext context, BasicInformationState basicInformationState) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          textCapitalization: TextCapitalization.words,
          initialValue: basicInformationState.middleName ?? '',
          key: const Key('account_middle_name_input'),
          labelText: 'Legal Middle Name (English)',
          textInputType: TextInputType.text,
          textInputFormatterList: [fullEnglishNameFormatter()],
          onChanged: (value) => context
              .read<BasicInformationBloc>()
              .add(BasicInformationMiddleNameChanged(value)),
          hintText: 'Enter your Middle name (Optional)'),
    );
  }

  Widget _lastNameInput(
      BuildContext context, BasicInformationState basicInformationState) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          textCapitalization: TextCapitalization.words,
          initialValue: basicInformationState.lastName,
          key: const Key('account_last_name_input'),
          textInputFormatterList: [fullEnglishNameFormatter()],
          labelText: 'Legal Last Name (English)',
          textInputType: TextInputType.text,
          onChanged: (value) => context
              .read<BasicInformationBloc>()
              .add(BasicInformationLastNameChanged(value)),
          hintText: 'Enter your Last name'),
    );
  }

  Widget _chineseNameInput(
      BuildContext context, BasicInformationState basicInformationState) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: CustomTextInput(
          textCapitalization: TextCapitalization.words,
          initialValue: basicInformationState.chineseName ?? '',
          key: const Key('account_chinese_name_input'),
          labelText: 'Chinese Name (Optional)',
          textInputType: TextInputType.text,
          textInputFormatterList: [chineseNameFormatter()],
          onChanged: (value) => context
              .read<BasicInformationBloc>()
              .add(BasicInformationChineseNameChanged(value)),
          hintText: 'Enter your Chinese name (Optional)'),
    );
  }

  Widget _selectGender(BuildContext context) =>
      BlocBuilder<BasicInformationBloc, BasicInformationState>(
          buildWhen: (_, __) => false,
          builder: (context, state) => CustomDropdown(
                hintName:
                    state.gender.isNotEmpty ? state.gender : 'Select Gender',
                value: state.gender,
                key: const Key('account_gender_select'),
                label: 'Gender',
                padding: const EdgeInsets.only(top: 10),
                itemsList: const ['Male', 'Female', 'Other'],
                onChanged: (gender) => context
                    .read<BasicInformationBloc>()
                    .add(BasicInformationGenderChanged(gender!)),
              ));

  Widget _datePicker() =>
      BlocBuilder<BasicInformationBloc, BasicInformationState>(
        buildWhen: ((previous, current) =>
            previous.dateOfBirth != current.dateOfBirth),
        builder: (context, state) {
          final DateTime dateTimeNow = DateTime.now();
          return CustomDatePicker(
            key: const Key('account_date_of_birth_picker'),
            padding: const EdgeInsets.only(top: 10),
            label: 'Date of Birth',
            selectedDate: DateTime.parse(state.dateOfBirth),
            initialDateTime: dateTimeNow,
            maximumDate: dateTimeNow,
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
            buildWhen: (previous, current) =>
                previous.countryCode != current.countryCode ||
                previous.phoneNumber != current.phoneNumber,
            builder: (context, state) => CustomPhoneNumberInput(
                  key: const Key('account_country_code_phone_number_input'),
                  initialValueOfCodeArea: state.countryCode,
                  initialValueOfPhoneNumber: state.phoneNumber,
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
        buildWhen: (previous, current) =>
            previous.countryOfCitizenship != current.countryOfCitizenship,
        builder: (context, state) => CustomCountryPicker(
          key: const Key('account_country_of_citizenship_input'),
          label: 'Country of Tax Residence',
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
              questionText: 'Are You a Hong Kong Permanent Resident?',
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
              textInputFormatterList: [
                lettersAndNumberFormatter(),
                UpperCaseTextFormatter(),
                LengthLimitingTextInputFormatter(9)
              ],
              errorText: state.isHkIdValid ? '' : 'HKID is not valid.',
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
              questionText:
                  'Are You a US Tax Resident, Green Card Holder, or US Citizen?',
              options: const ['Yes', 'No'],
              selectedAnswer: state.isUnitedStateResident != null
                  ? (state.isUnitedStateResident! ? 'Yes' : 'No')
                  : null,
              onSelected: (value) => context.read<BasicInformationBloc>().add(
                  BasicInformationIsUnitedStateResidentChanged(
                      value == 'Yes' ? true : false)),
            ),
          ],
        );
      },
    );
  }

  Widget _nextButton(BuildContext context) =>
      BlocConsumer<BasicInformationBloc, BasicInformationState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) => {
          if (state.status == ResponseState.error)
            {
              showAlertDialog(context, state.message!, onPressedOk: () {}),
            }
          else if (state.status == ResponseState.success)
            {
              context.read<NavigationBloc<UpgradeAccountPageStep>>().add(
                  const PageChanged(
                      UpgradeAccountPageStep.countryOfTaxResidence))
            },
          context
              .read<BasicInformationBloc>()
              .add(const BasicInformationReset())
        },
        buildWhen: (previous, current) =>
            previous.enableNextButton() != current.enableNextButton() ||
            previous.isHongKongPermanentResident !=
                current.isHongKongPermanentResident,
        builder: (context, state) {
          return UpgradeAccountButton(
              key: const Key('account_basic_information_next_step_button'),
              disable: !state.enableNextButton(),
              onClick: () => context
                  .read<BasicInformationBloc>()
                  .add(const BasicInformationNext()));
        },
      );
}
