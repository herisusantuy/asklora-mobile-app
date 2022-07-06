import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_dropdown.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';

class FinancialProfileForm extends StatelessWidget {
  final PageController controller;
  const FinancialProfileForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: [
              _annualIncomeDropdown(),
              _investibleLiquidAssetsDropdown(),
              _accountFundingSourceDropdown(),
              _employmentStatusDropdown(),
              _occupationDropdown(),
              _employerInput(),
            ],
          ),
        )),
        _nextButton()
      ],
    );
  }

  Widget _annualIncomeDropdown() {
    return CustomDropdown(
        padding: const EdgeInsets.only(top: 20),
        label: 'Annual Household Income',
        hintName: '-',
        itemsList: const [
          '0 to 200.000',
          '200.001 to 400.000',
          '400.001 to 600.000',
          '600.000 to 800.000',
          '800.001 to 1.000.000+',
        ],
        onChanged: (value) => value);
  }

  Widget _investibleLiquidAssetsDropdown() {
    return CustomDropdown(
        padding: const EdgeInsets.only(top: 10),
        label: 'Investible Liquid Assets',
        hintName: '-',
        itemsList: const [
          '0 to 200.000',
          '200.001 to 400.000',
          '400.001 to 600.000',
          '600.000 to 800.000',
          '800.001 to 1.000.000+',
        ],
        onChanged: (value) => value);
  }

  Widget _accountFundingSourceDropdown() {
    return CustomDropdown(
        padding: const EdgeInsets.only(top: 10),
        label: 'Account Funding Source',
        hintName: '-',
        itemsList: const [
          '0 to 200.000',
          '200.001 to 400.000',
          '400.001 to 600.000',
          '600.000 to 800.000',
          '800.001 to 1.000.000+',
        ],
        onChanged: (value) => value);
  }

  Widget _employmentStatusDropdown() {
    return CustomDropdown(
        padding: const EdgeInsets.only(top: 10),
        label: 'Employment Status',
        hintName: '-',
        itemsList: const [
          'Employed',
          'Unemployed',
          'Student',
          'Retired',
        ],
        onChanged: (value) => value);
  }

  Widget _occupationDropdown() {
    return Column(
      children: [
        CustomDropdown(
            padding: const EdgeInsets.only(top: 10),
            label: 'Occupation',
            hintName: '-',
            itemsList: const [
              'Healthcare',
              'Education',
              'Legal',
              'Business',
              'Finance',
              'IT',
              'Commercial',
              'Other',
            ],
            onChanged: (value) => value),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CustomTextInput(
                labelText: '',
                onChanged: (value) => value,
                hintText: 'Other',
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _employerInput() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: CustomTextInput(
            labelText: 'Employer',
            onChanged: (value) => value,
            hintText: 'Employer'),
      );

  Widget _nextButton() {
    return CustomTextButton(
        borderRadius: 30, buttonText: 'Next', onClick: () => '');
  }
}
