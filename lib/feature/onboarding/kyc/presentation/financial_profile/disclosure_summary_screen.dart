import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';
import '../widgets/summary_text_info.dart';
import 'widgets/dot_text.dart';

class DisclosureSummaryScreen extends StatelessWidget {
  final DisclosureAffiliationState disclosureAffiliationState;
  final double progress;

  const DisclosureSummaryScreen(
      {required this.disclosureAffiliationState,
      required this.progress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Financial Profile',
      content: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          CustomText(
            'Summary',
            type: FontType.h4,
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
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget _bottomButton(BuildContext context) => KycButtonPair(
        primaryButtonOnClick: () => context
            .read<NavigationBloc<KycPageStep>>()
            .add(const PageChanged(KycPageStep.verifyIdentity)),
        secondaryButtonOnClick: () => CarouselScreen.open(context),
        primaryButtonLabel: 'CONFIRM & CONTINUE',
        secondaryButtonLabel: 'SAVE FOR LATER',
      );

  Widget _dotText(String text) => DotText(
        text,
        color: Colors.grey,
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
}
