import 'widgets/upgrade_account_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_country_picker.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../../core/utils/formatters/custom_formatters.dart';
import '../../../../../core/utils/formatters/upper_case_text_formatter.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/country_of_tax_residence/bloc/country_of_tax_residence_bloc.dart';

class CountryOfTaxResidenceForm extends StatelessWidget {
  const CountryOfTaxResidenceForm({Key? key}) : super(key: key);

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
          buildWhen: (previous, current) =>
              previous.countryOfTaxResidence != current.countryOfTaxResidence,
          builder: (context, state) => CustomCountryPicker(
                key: const Key('account_country_of_tax_residence'),
                label: 'Country of Tax Residence',
                initialValue: state.countryNameOfTaxResidence,
                onSelect: (Country country) => context
                    .read<CountryOfTaxResidenceBloc>()
                    .add(CountryOfTaxResidenceChanged(
                        country.countryCodeIso3, country.name)),
              ));

  Widget _tinNumberInput(BuildContext context) =>
      BlocBuilder<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
        buildWhen: ((previous, current) =>
            previous.tinNumber != current.tinNumber ||
            previous.countryNameOfTaxResidence !=
                current.countryNameOfTaxResidence),
        builder: (context, state) => CustomTextInput(
            initialValue: state.tinNumber,
            key: const Key('account_tin_number_input'),
            labelText: 'TIN Number',
            hintText: 'Enter your TIN number',
            textInputFormatterList: [
              lettersAndNumberFormatter(),
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
      (countryCode == 'HKG') ? 'Please enter a valid TIN number' : '';

  Widget _nextButton() {
    return BlocBuilder<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
      buildWhen: (previous, current) =>
          previous.enableNextButton() != current.enableNextButton(),
      builder: (context, state) {
        return UpgradeAccountButton(
          key: const Key('account_country_of_tax_residence_next_step_button'),
          disable: !state.enableNextButton(),
          onClick: () {
            context
                .read<NavigationBloc<UpgradeAccountPageStep>>()
                .add(const PageChanged(UpgradeAccountPageStep.addressProof));
          },
        );
      },
    );
  }
}
