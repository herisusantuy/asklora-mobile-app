import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../../core/presentation/custom_country_picker.dart';
import '../../../../../../core/presentation/custom_text.dart';
import '../../../../../../core/presentation/text_fields/custom_dropdown.dart';
import '../../../../../../core/presentation/text_fields/master_text_field.dart';
import '../../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../domain/question.dart';
import '../../widget/header.dart';
import '../../widget/question_title.dart';
import '../bloc/financial_profile_bloc.dart';

class FinancialSituationQuestion extends StatelessWidget {
  final Function() onTapNext;
  final Function() onCancel;
  final QuestionCollection questionCollection;

  const FinancialSituationQuestion(
      {required this.onTapNext,
      required this.onCancel,
      required this.questionCollection,
      Key? key})
      : super(key: key);
  static const double _spaceHeightDouble = 36;
  final SizedBox _spaceHeight = const SizedBox(height: _spaceHeightDouble);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionHeader(
          key: const Key('question_header'),
          onTapBack: onCancel,
          // questionText: questionCollection.questions!.question!,
        ),
        Expanded(child: LayoutBuilder(builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      QuestionTitle(
                        question: questionCollection.questions!.question!,
                      ),
                      const CustomText(
                        'Employment',
                        fontWeight: FontWeight.bold,
                        type: FontType.h2,
                        margin: EdgeInsets.only(bottom: 30, left: 0),
                      ),
                      _employmentStatusDropdown,
                      _spaceHeight,
                      _getNatureOfBusinessDropdown,
                      _otherNatureOfBusinessDescriptionInput,
                      _spaceHeight,
                      _occupationDropdown,
                      _otherOccupationInput,
                      _spaceHeight,
                      _employerInput,
                      _spaceHeight,
                      _districtDropdown,
                      _spaceHeight,
                      _regionDropdown,
                      _spaceHeight,
                      _countryDropdown(context),
                      _spaceHeight,
                      _detailInformationOfCountryInput,
                    ],
                  ),
                  Column(
                    children: [_nextButton(), _saveForLaterButton()],
                  )
                ],
              ),
            ),
          );
        })),
      ],
    );
  }

  Widget get _investibleLiquidAssetsDropdown {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
      buildWhen: (previous, current) =>
          previous.investibleLiquidAssets != current.investibleLiquidAssets,
      builder: (context, state) {
        return CustomDropdown(
            key: const Key('account_investible_liquid_assets_select'),
            labelText: 'Investible Liquid Assets*',
            hintText: 'Please select',
            initialValue: state.investibleLiquidAssets,
            itemsList: incomeRangeItems,
            onChanged: (value) => context
                .read<FinancialProfileBloc>()
                .add(FinancialProfileInvestibleLiquidAssetChanged(value!)));
      },
    );
  }

  Widget get _fundingSourceDropdown {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
      buildWhen: (previous, current) =>
          previous.fundingSource != current.fundingSource,
      builder: (context, state) {
        return CustomDropdown(
            key: const Key('account_funding_source_select'),
            labelText: 'Account Funding Source*',
            hintText: 'Please select',
            itemsList: FundingSource.values.map((e) => e.value).toList()
              ..remove(FundingSource.unknown.value),
            initialValue: state.fundingSource != FundingSource.unknown
                ? state.fundingSource.value
                : '',
            onChanged: (value) => context.read<FinancialProfileBloc>().add(
                FinancialProfileFundingSourceChanged(FundingSource.values
                    .firstWhere((element) => element.value == value))));
      },
    );
  }

  Widget get _employmentStatusDropdown {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
        buildWhen: (previous, current) =>
            previous.employmentStatus != current.employmentStatus,
        builder: (context, state) => CustomDropdown(
            key: const Key('account_employment_status_select'),
            labelText: 'Employment Status*',
            hintText: 'Please select',
            itemsList: EmploymentStatus.values.map((e) => e.value).toList()
              ..remove(EmploymentStatus.unknown.value),
            initialValue: state.employmentStatus != EmploymentStatus.unknown
                ? state.employmentStatus.value
                : '',
            onChanged: (value) => context.read<FinancialProfileBloc>().add(
                FinancialProfileEmploymentStatusChanged(EmploymentStatus.values
                    .firstWhere((element) => element.value == value)))));
  }

  Widget get _getNatureOfBusinessDropdown {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
        buildWhen: (previous, current) =>
            previous.employmentStatus != current.employmentStatus ||
            previous.natureOfBusiness != current.natureOfBusiness,
        builder: (context, state) {
          if (state.employmentStatus == EmploymentStatus.employed ||
              state.employmentStatus == EmploymentStatus.selfEmployed) {
            return CustomDropdown(
                key: const Key('account_nature_of_business_select'),
                labelText: 'Nature Of Business*',
                hintText: 'Please select',
                initialValue: state.natureOfBusiness?.value ?? '',
                itemsList: NatureOfBusiness.values.map((e) => e.value).toList(),
                onChanged: (value) => context.read<FinancialProfileBloc>().add(
                    FinancialProfileNatureOfBusinessChanged(NatureOfBusiness
                        .values
                        .firstWhere((element) => element.value == value))));
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  Widget get _otherNatureOfBusinessDescriptionInput {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
        buildWhen: ((previous, current) =>
            previous.employmentStatus != current.employmentStatus ||
            previous.natureOfBusiness != current.natureOfBusiness ||
            previous.natureOfBusinessDescription !=
                current.natureOfBusinessDescription),
        builder: (context, state) {
          if ((state.employmentStatus == EmploymentStatus.employed ||
                  state.employmentStatus == EmploymentStatus.selfEmployed) &&
              state.natureOfBusiness == NatureOfBusiness.other) {
            return Padding(
              padding: const EdgeInsets.only(top: _spaceHeightDouble),
              child: MasterTextField(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                initialValue: state.natureOfBusinessDescription ?? '',
                key: const Key('account_other_nature_of_business_desc_input'),
                onChanged: (value) => context.read<FinancialProfileBloc>().add(
                    FinancialProfileNatureOfBusinessDescriptionChanged(value)),
                hintText: 'Nature of Business Description',
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  Widget get _occupationDropdown {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
      buildWhen: (previous, current) =>
          previous.employmentStatus != current.employmentStatus ||
          previous.occupation != current.occupation,
      builder: (context, state) {
        if (state.employmentStatus == EmploymentStatus.employed ||
            state.employmentStatus == EmploymentStatus.selfEmployed) {
          return CustomDropdown(
            key: const Key('account_occupation_select'),
            labelText: 'Occupation*',
            itemsList: Occupations.values.map((e) => e.value).toList(),
            initialValue: state.occupation?.value ?? '',
            hintText: 'Please select',
            onChanged: (value) => context.read<FinancialProfileBloc>().add(
                FinancialProfileOccupationChanged(Occupations.values
                    .firstWhere((element) => element.value == value))),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget get _otherOccupationInput =>
      BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
          buildWhen: (previous, current) =>
              previous.employmentStatus != current.employmentStatus ||
              previous.occupation != current.occupation,
          builder: (context, state) {
            if ((state.employmentStatus == EmploymentStatus.employed ||
                    state.employmentStatus == EmploymentStatus.selfEmployed) &&
                state.occupation == Occupations.other) {
              return Padding(
                padding: const EdgeInsets.only(top: _spaceHeightDouble),
                child: MasterTextField(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  initialValue: state.otherOccupation ?? '',
                  key: const Key('account_other_occupation_input'),
                  labelText: 'Other Occupation*',
                  onChanged: (value) => context
                      .read<FinancialProfileBloc>()
                      .add(FinancialProfileOtherOccupationChanged(value)),
                  hintText: 'Other Occupation*',
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          });

  Widget get _employerInput =>
      BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
        buildWhen: (previous, current) =>
            previous.employmentStatus != current.employmentStatus,
        builder: (context, state) {
          if (state.employmentStatus == EmploymentStatus.employed ||
              state.employmentStatus == EmploymentStatus.selfEmployed) {
            return Column(
              children: [
                MasterTextField(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    initialValue: state.employer ?? '',
                    key: const Key('account_employer_input'),
                    labelText: 'Employer*',
                    onChanged: (value) => context
                        .read<FinancialProfileBloc>()
                        .add(FinancialProfileEmployerChanged(value)),
                    hintText: 'Company name'),
                _spaceHeight,
                MasterTextField(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  initialValue: state.employerAddress ?? '',
                  key: const Key('account_employer_address_input'),
                  labelText: 'Employer/ Company Address*',
                  onChanged: (value) => context
                      .read<FinancialProfileBloc>()
                      .add(FinancialProfileEmployerAddressChanged(value)),
                  hintText: 'Company Address 1',
                ),
                const SizedBox(
                  height: _spaceHeightDouble,
                ),
                MasterTextField(
                  initialValue: state.employerAddress ?? '',
                  key: const Key('account_employer_address_two_input'),
                  onChanged: (value) => context
                      .read<FinancialProfileBloc>()
                      .add(FinancialProfileEmployerAddressTwoChanged(value)),
                  hintText: 'Employer Address 2',
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      );

  Widget get _districtDropdown {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
        buildWhen: (previous, current) =>
            previous.employmentStatus != current.employmentStatus ||
            previous.district != current.district,
        builder: (context, state) {
          if (state.employmentStatus == EmploymentStatus.employed ||
              state.employmentStatus == EmploymentStatus.selfEmployed) {
            return CustomDropdown(
                key: const Key('account_district_select'),
                labelText: 'District*',
                hintText: 'Please select',
                itemsList: District.values.map((e) => e.value).toList(),
                initialValue: state.district?.value ?? '',
                onChanged: (value) => context.read<FinancialProfileBloc>().add(
                    FinancialProfileDistrictChanged(District.values
                        .firstWhere((element) => element.value == value))));
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  Widget get _regionDropdown {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
        buildWhen: (previous, current) =>
            previous.employmentStatus != current.employmentStatus ||
            previous.region != current.region,
        builder: (context, state) {
          if (state.employmentStatus == EmploymentStatus.employed ||
              state.employmentStatus == EmploymentStatus.selfEmployed) {
            return CustomDropdown(
                key: const Key('account_region_select'),
                labelText: 'Region*',
                hintText: 'Please select',
                itemsList: Region.values.map((e) => e.value).toList(),
                initialValue: state.region?.value ?? '',
                onChanged: (value) => context.read<FinancialProfileBloc>().add(
                    FinancialProfileRegionChanged(Region.values
                        .firstWhere((element) => element.value == value))));
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  Widget _countryDropdown(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 0),
        child: BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
            buildWhen: (previous, current) =>
                previous.employmentStatus != current.employmentStatus ||
                previous.country != current.country,
            builder: (context, state) {
              if (state.employmentStatus == EmploymentStatus.employed ||
                  state.employmentStatus == EmploymentStatus.selfEmployed) {
                return CustomCountryPicker(
                    key: const Key('account_country_select'),
                    label: 'Country*',
                    initialValue: state.countryName ?? '',
                    onSelect: (Country country) => context
                        .read<FinancialProfileBloc>()
                        .add(FinancialProfileCountryChanged(
                            country.countryCodeIso3, country.name)));
              } else {
                return const SizedBox.shrink();
              }
            }),
      );

  Widget get _detailInformationOfCountryInput {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
        buildWhen: (previous, current) =>
            previous.employmentStatus != current.employmentStatus ||
            previous.country != current.country ||
            previous.detailInformationOfCountry !=
                current.detailInformationOfCountry,
        builder: (context, state) {
          if (state.country != '' &&
              state.country != 'HKG' &&
              (state.employmentStatus == EmploymentStatus.employed ||
                  state.employmentStatus == EmploymentStatus.selfEmployed)) {
            return Padding(
              padding: const EdgeInsets.only(top: 0),
              child: MasterTextField(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                initialValue: state.detailInformationOfCountry ?? '',
                key: const Key('account_detail_information_of_country_input'),
                labelText:
                    'Why is your country of employment different from your country of residence?*',
                onChanged: (value) => context.read<FinancialProfileBloc>().add(
                    FinancialProfileDetailInformationOfCountryChanged(value)),
                hintText: 'Use this space to provide more detailed information',
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        });
  }

  Widget _nextButton() {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
        buildWhen: (previous, current) =>
            previous.enableNextButton() != current.enableNextButton(),
        builder: (context, state) => Padding(
              padding: const EdgeInsets.only(top: 52),
              child: PrimaryButton(
                label: 'NEXT',
                buttonPrimaryType: ButtonPrimaryType.solidCharcoal,
                key: const Key('question_next_button'),
                disabled: !state.enableNextButton(),
                onTap: onTapNext,
              ),
            ));
  }

  Widget _saveForLaterButton() {
    return BlocBuilder<FinancialProfileBloc, FinancialProfileState>(
        builder: (context, state) => Padding(
              padding: const EdgeInsets.only(top: 25),
              child: CustomTextButton(
                label: 'SAVE FOR LATER',
                key: const Key('question_save_for_later_button'),
                onTap: onTapNext,
              ),
            ));
  }
}
