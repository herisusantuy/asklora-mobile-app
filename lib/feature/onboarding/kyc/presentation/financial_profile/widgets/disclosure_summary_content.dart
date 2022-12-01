import 'package:flutter/material.dart';

import '../../../../../../core/presentation/custom_text.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../../widgets/kyc_sub_title.dart';
import '../../widgets/summary_text_info.dart';
import 'dot_text.dart';

class DisclosureSummaryContent extends StatelessWidget {
  final String title;
  final DisclosureAffiliationState disclosureAffiliationState;

  const DisclosureSummaryContent(
      {Key? key, required this.disclosureAffiliationState, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KycSubTitle(
            subTitle: title,
            padding: AppValues.screenHorizontalPadding.copyWith(bottom: 6),
          ),
          SummaryTextInfo(
              titleWidget: _affiliatedQuestionWidget,
              subTitle: disclosureAffiliationState.isAffiliatedPerson != null
                  ? disclosureAffiliationState.isAffiliatedPerson!
                      ? 'Yes'
                      : 'No'
                  : 'Unknown'),
          if (disclosureAffiliationState.affiliatedPersonFirstName.isNotEmpty)
            SummaryTextInfo(
                title: 'Name of Affiliated Person',
                subTitle:
                    '${disclosureAffiliationState.affiliatedPersonFirstName} ${disclosureAffiliationState.affiliatedPersonLastName}'),
          SummaryTextInfo(
              title:
                  'Are your immediate family or/and you affiliated with any director, office or employee if LORA Technologies Limited ot its associates?',
              subTitle:
                  disclosureAffiliationState.isAffiliatedAssociates != null
                      ? disclosureAffiliationState.isAffiliatedAssociates!
                          ? 'Yes'
                          : 'No'
                      : 'Unknown'),
          if (disclosureAffiliationState
              .affiliatedAssociatesFirstName.isNotEmpty)
            SummaryTextInfo(
                title: 'Name of Affiliated Person',
                subTitle:
                    '${disclosureAffiliationState.affiliatedAssociatesFirstName} ${disclosureAffiliationState.affiliatedAssociatesLastName}'),
          SummaryTextInfo(
              title:
                  'Are your immediate family or/and you a director, employee, or licensed person registered with the Hong Kong Securities and Futures Commission.',
              subTitle:
                  disclosureAffiliationState.isAffiliatedCommission != null
                      ? disclosureAffiliationState.isAffiliatedCommission!
                          ? 'Yes'
                          : 'No'
                      : 'Unknown'),
        ],
      );

  Widget get _affiliatedQuestionWidget => Column(
        children: [
          const CustomText(
            'Do any of the following apply to you or a member of your immediate family ?',
            type: FontType.smallText,
            color: Colors.grey,
          ),
          _dotText(
            'I am affiliated or work with US registered broker-dealer or FINRA.',
          ),
          _dotText(
              'I am a senior executive at or a 10% or greater shareholder of a publicly traded company.'),
          _dotText('I am a senior political figure.'),
          _dotText(
              'I am a family member or relative of a senior political figure.'),
          _dotText(
              'I am a director, employee, or licensed person registered with the Hong Kong Securities and Futures Commission.'),
        ],
      );

  Widget _dotText(String text) => DotText(
        text,
        color: Colors.grey,
        padding: AppValues.screenHorizontalPadding.copyWith(top: 24),
      );
}
