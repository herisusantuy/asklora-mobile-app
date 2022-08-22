import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_dropdown.dart';
import '../../../../../core/presentation/custom_text_input.dart';
import '../../../../payment/deposits/bloc/navigation_bloc/navigation_bloc.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/financial_profile/bloc/financial_profile_bloc.dart';
import 'widgets/upgrade_account_button.dart';

class FinancialProfileForm extends StatelessWidget {
  const FinancialProfileForm({Key? key}) : super(key: key);

  final incomeRange = const [
    '0 - 200,000',
    '200,001 - 400,000',
    '400,001 - 600,000',
    '600,000 - 800,000',
    '800,001 - 1,000,000+',
  ];

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
              _fundingSourceDropdown(),
              _employmentStatusDropdown(),
            ],
          ),
        )),
        _nextButton()
      ],
    );
  }

  Widget _annualIncomeDropdown() {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
      buildWhen: (previous, current) =>
          previous.annualHouseholdIncome != current.annualHouseholdIncome,
      builder: (context, state) {
        return CustomDropdown(
            key: const Key('account_annual_income_select'),
            padding: const EdgeInsets.only(top: 20),
            label: 'Annual Household Income',
            hintName: state.annualHouseholdIncome.isNotEmpty
                ? state.annualHouseholdIncome
                : '-',
            value: state.annualHouseholdIncome,
            itemsList: incomeRange,
            onChanged: (value) => context
                .read<FinancialProfileBloc>()
                .add(FinancialProfileAnnualHouseholdIncomeChanged(value!)));
      },
    );
  }

  Widget _investibleLiquidAssetsDropdown() {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
      buildWhen: (previous, current) =>
          previous.investibleLiquidAssets != current.investibleLiquidAssets,
      builder: (context, state) {
        return CustomDropdown(
            key: const Key('account_investible_liquid_assets_select'),
            padding: const EdgeInsets.only(top: 10),
            label: 'Investible Liquid Assets',
            hintName: state.investibleLiquidAssets.isNotEmpty
                ? state.investibleLiquidAssets
                : '-',
            value: state.investibleLiquidAssets,
            itemsList: incomeRange,
            onChanged: (value) => context
                .read<FinancialProfileBloc>()
                .add(FinancialProfileInvestibleLiquidAssetChanged(value!)));
      },
    );
  }

  Widget _fundingSourceDropdown() {
    List<String> itemList = FundingSource.values.map((e) => e.name).toList();
    itemList.remove('unknown');
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
      buildWhen: (previous, current) =>
          previous.fundingSource != current.fundingSource,
      builder: (context, state) {
        return CustomDropdown(
            key: const Key('account_funding_source_select'),
            padding: const EdgeInsets.only(top: 10),
            label: 'Account Funding Source',
            hintName: state.fundingSource != FundingSource.unknown
                ? state.fundingSource.name
                : '-',
            itemsList: itemList,
            value: state.fundingSource.name,
            onChanged: (value) {
              final fundingSource = FundingSource.values.byName(value!);
              context
                  .read<FinancialProfileBloc>()
                  .add(FinancialProfileFundingSourceChanged(fundingSource));
            });
      },
    );
  }

  Widget _employmentStatusDropdown() {
    List<String> itemList = EmploymentStatus.values.map((e) => e.name).toList();
    itemList.remove('unknown');
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
      buildWhen: (previous, current) =>
          previous.employmentStatus != current.employmentStatus,
      builder: (context, state) {
        return Column(
          children: [
            CustomDropdown(
                key: const Key('account_employment_status_select'),
                padding: const EdgeInsets.only(top: 10),
                label: 'Employment Status',
                hintName: state.employmentStatus != EmploymentStatus.unknown
                    ? state.employmentStatus.name
                    : '-',
                itemsList: itemList,
                value: state.employmentStatus.name,
                onChanged: (value) {
                  final employmentStatus =
                      EmploymentStatus.values.byName(value!);
                  context.read<FinancialProfileBloc>().add(
                      FinancialProfileEmploymentStatusChanged(
                          employmentStatus));
                }),
            if (state.employmentStatus == EmploymentStatus.employed)
              Column(
                children: [
                  _occupationDropdown(),
                  _employerInput(context),
                  _employerAddressInput(context)
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
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
      buildWhen: (previous, current) =>
          previous.occupation != current.occupation,
      builder: (context, state) {
        return Column(
          children: [
            CustomDropdown(
              key: const Key('account_occupation_select'),
              padding: const EdgeInsets.only(top: 10),
              label: 'Occupation',
              hintName: state.occupation ?? '-',
              itemsList: items,
              value: state.occupation ?? '',
              onChanged: (value) => context
                  .read<FinancialProfileBloc>()
                  .add(FinancialProfileOccupationChanged(value!)),
            ),
            if (state.occupation == 'Other') _otherOccupationInput(context),
          ],
        );
      },
    );
  }

  Widget _otherOccupationInput(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
            buildWhen: (previous, current) => false,
            builder: (context, state) => CustomTextInput(
                  initialValue: state.otherOccupation ?? '',
                  key: const Key('account_other_occupation_input'),
                  labelText: 'Other Occupation',
                  onChanged: (value) => context
                      .read<FinancialProfileBloc>()
                      .add(FinancialProfileOtherOccupationChanged(value)),
                  hintText: 'Other',
                )),
      );

  Widget _employerInput(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 20),
      child: BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) => CustomTextInput(
            initialValue: state.employer ?? '',
            key: const Key('account_employer_input'),
            labelText: 'Employer',
            onChanged: (value) => context
                .read<FinancialProfileBloc>()
                .add(FinancialProfileEmployerChanged(value)),
            hintText: 'Employer'),
      ));

  Widget _employerAddressInput(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 10),
      child: BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
        buildWhen: (previous, current) => false,
        builder: (context, state) => CustomTextInput(
          initialValue: state.employerAddress ?? '',
          key: const Key('account_employer_address_input'),
          labelText: 'Employer Address',
          onChanged: (value) => context
              .read<FinancialProfileBloc>()
              .add(FinancialProfileEmployerAddressChanged(value)),
          hintText: 'Employer Address',
        ),
      ));

  Widget _nextButton() {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
      buildWhen: (previous, current) =>
          previous.enableNextButton() != current.enableNextButton(),
      builder: (context, state) {
        return UpgradeAccountButton(
            key: const Key('account_financial_profile_next_step_button'),
            disable: !state.enableNextButton(),
            onClick: () => context
                .read<NavigationBloc<UpgradeAccountPageStep>>()
                .add(const PageChanged(
                    UpgradeAccountPageStep.disclosureAffiliation)));
      },
    );
  }
}
