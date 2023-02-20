import 'package:flutter/material.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../../../bloc/financial_profile/financial_profile_bloc.dart';
import '../../../bloc/source_of_wealth/source_of_wealth_bloc.dart';
import '../../../utils/kyc_dropdown_enum.dart';
import '../../widgets/kyc_sub_title.dart';
import '../../widgets/summary_text_info.dart';
import 'dot_text.dart';

class FinancialProfileSummaryContent extends StatelessWidget {
  final String title;
  final DisclosureAffiliationState disclosureAffiliationState;
  final FinancialProfileState financialProfileState;
  final SourceOfWealthState sourceOfWealthState;

  const FinancialProfileSummaryContent(
      {Key? key,
      required this.disclosureAffiliationState,
      required this.financialProfileState,
      required this.sourceOfWealthState,
      required this.title})
      : super(key: key);
  static const double _spaceHeightDouble = 20;
  final SizedBox _spaceHeight = const SizedBox(height: _spaceHeightDouble);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KycSubTitle(
          subTitle: title,
        ),
        _spaceHeight,
        ..._sourceOfWealthSummary,
        _spaceHeight,
        SummaryTextInfo(
            title: 'Employment Status',
            subTitle: financialProfileState.employmentStatus.value),
        if (financialProfileState.natureOfBusiness != null)
          _summaryTextInfoWithPadding(
              title: 'Nature of Business',
              subTitle: financialProfileState.natureOfBusiness?.value ?? ''),
        if (financialProfileState.occupation != null ||
            financialProfileState.otherOccupation.isNotEmpty &&
                financialProfileState.otherOccupation.isNotEmpty)
          _summaryTextInfoWithPadding(
              title: 'Occupation',
              subTitle: financialProfileState.occupation != null &&
                      financialProfileState.occupation != Occupations.other
                  ? financialProfileState.occupation!.value
                  : financialProfileState.occupation != null &&
                          financialProfileState.occupation == Occupations.other
                      ? financialProfileState.otherOccupation
                      : ''),
        if (financialProfileState.employer.isNotEmpty)
          _summaryTextInfoWithPadding(
              title: 'Employer', subTitle: financialProfileState.employer),
        if (financialProfileState.employerAddress.isNotEmpty)
          _summaryTextInfoWithPadding(
              title: 'Employer/ Company Address',
              subTitle: financialProfileState.employerAddress),
        if (financialProfileState.countryName.isNotEmpty)
          _summaryTextInfoWithPadding(
              title: 'Country of Employment',
              subTitle: financialProfileState.countryName),
        if (financialProfileState.country != 'HKG' &&
            financialProfileState.detailInformationOfCountry.isNotEmpty)
          _summaryTextInfoWithPadding(
              title:
                  'Why is your country of employment different from your country of residence?',
              subTitle: financialProfileState.detailInformationOfCountry),
        _spaceHeight,
        SummaryTextInfo(
            titleWidget: _affiliatedQuestionWidget,
            subTitle: disclosureAffiliationState.isAffiliatedPerson != null
                ? disclosureAffiliationState.isAffiliatedPerson!
                    ? 'Yes'
                    : 'No'
                : 'Unknown'),
        if (disclosureAffiliationState.affiliatedPersonFirstName.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: _spaceHeightDouble),
            child: SummaryTextInfo(
                title: 'Name of Affiliated Person',
                subTitle:
                    '${disclosureAffiliationState.affiliatedPersonFirstName} ${disclosureAffiliationState.affiliatedPersonLastName}'),
          ),
        _spaceHeight,
        SummaryTextInfo(
            title:
                'Are your immediate family or/and you affiliated with any director, office or employee if LORA Technologies Limited ot its associates?',
            subTitle: disclosureAffiliationState.isAffiliatedAssociates != null
                ? disclosureAffiliationState.isAffiliatedAssociates!
                    ? 'Yes'
                    : 'No'
                : 'Unknown'),
        if (disclosureAffiliationState.affiliatedAssociatesFirstName.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: _spaceHeightDouble),
            child: SummaryTextInfo(
                title: 'Name of Affiliated Person',
                subTitle:
                    '${disclosureAffiliationState.affiliatedAssociatesFirstName} ${disclosureAffiliationState.affiliatedAssociatesLastName}'),
          ),
        _spaceHeight,
        SummaryTextInfo(
            title:
                'Are your immediate family or/and you a director, employee, or licensed person registered with the Hong Kong Securities and Futures Commission.',
            subTitle: disclosureAffiliationState.isAffiliatedCommission != null
                ? disclosureAffiliationState.isAffiliatedCommission!
                    ? 'Yes'
                    : 'No'
                : 'Unknown'),
      ],
    );
  }

  Widget get _spaceHeightAffiliated => const SizedBox(
        height: 10,
      );

  Widget get _affiliatedQuestionWidget => Column(
        children: [
          CustomTextNew(
            'Do any of the following apply to you or a member of your immediate family ?',
            style: AskLoraTextStyles.body2.copyWith(color: AskLoraColors.gray),
          ),
          _spaceHeightAffiliated,
          _dotText(
            'I am affiliated or work with US registered broker-dealer or FINRA.',
          ),
          _spaceHeightAffiliated,
          _dotText(
              'I am a senior executive at or a 10% or greater shareholder of a publicly traded company.'),
          _spaceHeightAffiliated,
          _dotText('I am a senior political figure.'),
          _spaceHeightAffiliated,
          _dotText(
              'I am a family member or relative of a senior political figure.'),
          _spaceHeightAffiliated,
          _dotText(
              'I am a director, employee, or licensed person registered with the Hong Kong Securities and Futures Commission.'),
        ],
      );

  Widget _dotText(String text) => DotText(
        text,
        style: AskLoraTextStyles.body2.copyWith(color: AskLoraColors.gray),
        color: AskLoraColors.gray,
      );

  List<Widget> get _sourceOfWealthSummary {
    return [
      CustomTextNew(
        'Source Of Wealth',
        style: AskLoraTextStyles.body2.copyWith(color: AskLoraColors.gray),
      ),
      const SizedBox(
        height: 10,
      ),
      ...sourceOfWealthState.sourceOfWealthAnswers.map((e) {
        if (e.amount == 0) {
          return const SizedBox();
        } else {
          return CustomTextNew(
            e.sourceOfWealthType.value == 'Other'
                ? '${e.sourceOfWealthType.value} : ${e.additionalSourceOfWealth!}'
                : e.sourceOfWealthType.value,
            style: AskLoraTextStyles.subtitle2
                .copyWith(color: AskLoraColors.charcoal),
          );
        }
      }).toList()
    ];
  }

  Widget _summaryTextInfoWithPadding(
          {required String title, required String subTitle}) =>
      Padding(
        padding: const EdgeInsets.only(top: _spaceHeightDouble),
        child: SummaryTextInfo(title: title, subTitle: subTitle),
      );
}
