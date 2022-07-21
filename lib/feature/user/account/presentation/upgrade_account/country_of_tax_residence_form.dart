import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/country_of_tax_residence/bloc/country_of_tax_residence_bloc.dart';
import '../../../../../core/presentation/custom_country_picker.dart';

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
              _countryOfTaxResidence(context),
              _tinNumberInput(context),
            ],
          ),
        ),
        _nextButton()
      ],
    );
  }

  Widget _countryOfTaxResidence(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 20),
      child: BlocBuilder<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
        builder: (context, state) => CustomCountryPicker(
          key: const Key('account_country_of_tax_residence'),
          title: 'Country of Tax Residence',
          initialValue: state.countryNameOfTaxResidence,
          onSelect: (Country country) => context
              .read<CountryOfTaxResidenceBloc>()
              .add(CountryOfTaxResidenceChanged(
                  country.countryCode, country.name)),
        ),
      ));

  Widget _tinNumberInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomTextInput(
          key: const Key('account_tin_number_input'),
          labelText: 'TIN Number',
          hintText: 'Enter your TIN number',
          onChanged: (value) => context
              .read<CountryOfTaxResidenceBloc>()
              .add(TinNumberChanged(value))),
    );
  }

  Widget _nextButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: BlocBuilder<CountryOfTaxResidenceBloc, CountryOfTaxResidenceState>(
        buildWhen: (previous, current) =>
            previous.enableNextButton() != current.enableNextButton(),
        builder: (context, state) {
          return CustomTextButton(
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
          );
        },
      ),
    );
  }
}
