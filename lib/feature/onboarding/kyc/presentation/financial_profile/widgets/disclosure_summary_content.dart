import 'package:flutter/material.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
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

  static const double _spaceHeightDouble = 20;
  final SizedBox _spaceHeight = const SizedBox(height: _spaceHeightDouble);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KycSubTitle(
            subTitle: title,
          ),
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
              subTitle:
                  disclosureAffiliationState.isAffiliatedAssociates != null
                      ? disclosureAffiliationState.isAffiliatedAssociates!
                          ? 'Yes'
                          : 'No'
                      : 'Unknown'),
          if (disclosureAffiliationState
              .affiliatedAssociatesFirstName.isNotEmpty)
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
              subTitle:
                  disclosureAffiliationState.isAffiliatedCommission != null
                      ? disclosureAffiliationState.isAffiliatedCommission!
                          ? 'Yes'
                          : 'No'
                      : 'Unknown'),
        ],
      );

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
}
