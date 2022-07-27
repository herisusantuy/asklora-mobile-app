import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_country_picker.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/utils/formatters/upper_case_text_formatter.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/country_of_tax_residence/bloc/country_of_tax_residence_bloc.dart';

class CountryOfTaxResidenceForm extends StatelessWidget {
  final PageController controller;

  const CountryOfTaxResidenceForm({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _padding(),
            const Text(
                'Please specify your country of tax residence and your corresponding Tax identification Number (TIN). For Hong Kong residents your TIN is your HKID number (e.g. if P123456(7) is your HKID, your TIN is P1234567)'),
            _padding(),
            _countryOfTaxResidence(context),
            _padding(),
            _tinNumberInput(context),
          ],
        )),
        _nextButton()
      ],
    );
  }

  Padding _padding() =>
      const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0));

  Widget _countryOfTaxResidence(BuildContext context) =>
      BlocBuilder<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
          builder: (context, state) => CustomCountryPicker(
                key: const Key('account_country_of_tax_residence'),
                title: 'Country of Tax Residence',
                initialValue: state.countryNameOfTaxResidence,
                onSelect: (Country country) => context
                    .read<CountryOfTaxResidenceBloc>()
                    .add(CountryOfTaxResidenceChanged(
                        country.countryCodeIso3, country.name)),
              ));

  Widget _tinNumberInput(BuildContext context) =>
      BlocBuilder<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
        buildWhen: ((previous, current) =>
            previous.tinNumber != current.tinNumber),
        builder: (context, state) => CustomTextInput(
            initialValue: state.tinNumber,
            key: const Key('account_tin_number_input'),
            labelText: 'TIN Number',
            hintText: 'Enter your TIN number',
            textInputFormatterList: [
              UpperCaseTextFormatter(),
              LengthLimitingTextInputFormatter(
                  state.countryOfTaxResidence == 'HKG' ? 9 : 15)
            ],
            errorText: state.isHkIdValid
                ? ''
                : _idNumberErrorText(state.countryOfTaxResidence),
            onChanged: (value) => context
                .read<CountryOfTaxResidenceBloc>()
                .add(TinNumberChanged(value))),
      );

  String _idNumberErrorText(String countryCode) =>
      (countryCode == 'HKG') ? 'Enter valid HKID number' : '';

  Widget _nextButton() {
    return BlocBuilder<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
      buildWhen: (previous, current) =>
          previous.enableNextButton() != current.enableNextButton(),
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: CustomTextButton(
            key: const Key('account_country_of_tax_residence_next_step_button'),
            buttonText: 'Next',
            borderRadius: 30,
            disable: !state.enableNextButton(),
            onClick: () {
              context
                  .read<AccountBloc>()
                  .add(const AccountCurrentStepChanged('next'));
              controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease);
            },
          ),
        );
      },
    );
  }
}
