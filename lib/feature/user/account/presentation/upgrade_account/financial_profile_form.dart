import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_dropdown.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../bloc/account_bloc.dart';

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
            ],
          ),
        )),
        _nextButton()
      ],
    );
  }

  Widget _annualIncomeDropdown() {
    return BlocBuilder<AccountBloc, AccountState>(
      buildWhen: (previous, current) =>
          previous.annualHouseholdIncome != current.annualHouseholdIncome,
      builder: (context, state) {
        return CustomDropdown(
            key: const Key('account_annual_income_select'),
            padding: const EdgeInsets.only(top: 20),
            label: 'Annual Household Income',
            hintName: '-',
            value: state.annualHouseholdIncome,
            itemsList: const [
              '0 to 200.000',
              '200.001 to 400.000',
              '400.001 to 600.000',
              '600.000 to 800.000',
              '800.001 to 1.000.000+',
            ],
            onChanged: (value) => context
                .read<AccountBloc>()
                .add(AccountAnnualIncomeChanged(value!)));
      },
    );
  }

  Widget _investibleLiquidAssetsDropdown() {
    return BlocBuilder<AccountBloc, AccountState>(
      buildWhen: (previous, current) =>
          previous.investibleLiquidAssets != current.investibleLiquidAssets,
      builder: (context, state) {
        return CustomDropdown(
            key: const Key('account_investible_liquid_assets_select'),
            padding: const EdgeInsets.only(top: 10),
            label: 'Investible Liquid Assets',
            hintName: '-',
            value: state.investibleLiquidAssets,
            itemsList: const [
              '0 to 200.000',
              '200.001 to 400.000',
              '400.001 to 600.000',
              '600.000 to 800.000',
              '800.001 to 1.000.000+',
            ],
            onChanged: (value) => context
                .read<AccountBloc>()
                .add(AccountInvestibleLiquidAssetChanged(value!)));
      },
    );
  }

  Widget _accountFundingSourceDropdown() {
    return BlocBuilder<AccountBloc, AccountState>(
      buildWhen: (previous, current) =>
          previous.fundingSource != current.fundingSource,
      builder: (context, state) {
        return CustomDropdown(
            key: const Key('account_funding_source_select'),
            padding: const EdgeInsets.only(top: 10),
            label: 'Account Funding Source',
            hintName: '-',
            itemsList: FundingSource.values.map((item) => item.name).toList(),
            value: state.fundingSource.name,
            onChanged: (value) {
              final fundingSource = FundingSource.values.byName(value!);
              context
                  .read<AccountBloc>()
                  .add(AccountFundingSourceChanged(fundingSource));
            });
      },
    );
  }

  Widget _employmentStatusDropdown() {
    return BlocBuilder<AccountBloc, AccountState>(
      buildWhen: (previous, current) =>
          previous.employmentStatus != current.employmentStatus,
      builder: (context, state) {
        return Column(
          children: [
            CustomDropdown(
                key: const Key('account_employment_status_select'),
                padding: const EdgeInsets.only(top: 10),
                label: 'Employment Status',
                hintName: '-',
                itemsList: EmploymentStatus.values.map((e) => e.name).toList(),
                value: state.employmentStatus.name,
                onChanged: (value) {
                  final employmentStatus =
                      EmploymentStatus.values.byName(value!);
                  context
                      .read<AccountBloc>()
                      .add(AccountEmploymentStatusChanged(employmentStatus));
                }),
            if (state.employmentStatus == EmploymentStatus.employed)
              Column(
                children: [
                  _occupationDropdown(),
                  _employerInput(),
                  _employerAddressInput()
                ],
              )
          ],
        );
      },
    );
  }

  Widget _occupationDropdown() {
    List<String> items = [
      'Healthcare',
      'Education',
      'Legal',
      'Business',
      'Finance',
      'IT',
      'Commercial',
      'Other',
    ];
    return BlocBuilder<AccountBloc, AccountState>(
      buildWhen: (previous, current) =>
          previous.occupation != current.occupation,
      builder: (context, state) {
        return Column(
          children: [
            CustomDropdown(
              key: const Key('account_occupation_select'),
              padding: const EdgeInsets.only(top: 10),
              label: 'Occupation',
              hintName: '-',
              itemsList: items,
              value: state.occupation,
              onChanged: (value) => context
                  .read<AccountBloc>()
                  .add(AccountOccupationChanged(value!)),
            ),
            if (state.occupation == 'Other' ||
                !items.contains(state.occupation))
              _occupationInput(),
          ],
        );
      },
    );
  }

  Widget _occupationInput() => BlocBuilder<AccountBloc, AccountState>(
        buildWhen: (previous, current) =>
            previous.occupation != current.occupation,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextInput(
              key: const Key('account_occupation_input'),
              labelText: '',
              onChanged: (value) => context
                  .read<AccountBloc>()
                  .add(AccountOccupationChanged(value)),
              hintText: 'Other',
            ),
          );
        },
      );
  Widget _employerInput() => BlocBuilder<AccountBloc, AccountState>(
        buildWhen: (previous, current) => previous.employer != current.employer,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomTextInput(
                key: const Key('account_employer_input'),
                labelText: 'Employer',
                onChanged: (value) => context
                    .read<AccountBloc>()
                    .add(AccountEmployerChanged(value)),
                hintText: 'Employer'),
          );
        },
      );
  Widget _employerAddressInput() => BlocBuilder<AccountBloc, AccountState>(
        buildWhen: (previous, current) =>
            previous.employerAddress != current.employerAddress,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CustomTextInput(
              key: const Key('account_employer_address_input'),
              labelText: 'Employer Address',
              onChanged: (value) => context
                  .read<AccountBloc>()
                  .add(AccountEmployerAddressChanged(value)),
              hintText: 'Employer Address',
            ),
          );
        },
      );

  Widget _nextButton() {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CustomTextButton(
              disable: _disabledNextButton(state),
              borderRadius: 30,
              buttonText: 'Next',
              onClick: () => controller.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease)),
        );
      },
    );
  }

  bool _disabledNextButton(AccountState state) {
    if (state.annualHouseholdIncome.isEmpty ||
        state.investibleLiquidAssets.isEmpty ||
        state.fundingSource == FundingSource.unknown ||
        state.employmentStatus == EmploymentStatus.unknown ||
        state.employmentStatus == EmploymentStatus.employed) {
      if (state.occupation.isEmpty ||
          state.employer.isEmpty ||
          state.employerAddress.isEmpty ||
          state.occupation == 'Other') {
        return true;
      }
    }
    return false;
  }
}
