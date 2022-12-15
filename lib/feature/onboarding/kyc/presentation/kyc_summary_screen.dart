import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../welcome/carousel/presentation/carousel_screen.dart';
import '../bloc/address_proof/address_proof_bloc.dart';
import '../bloc/basic_information/basic_information_bloc.dart';
import '../bloc/country_of_tax_residence/country_of_tax_residence_bloc.dart';
import '../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../bloc/kyc_bloc.dart';
import 'financial_profile/widgets/disclosure_summary_content.dart';
import 'personal_info/widgets/personal_info_summary_content.dart';
import 'sign_agreements/widgets/sign_agreement_summary_content.dart';
import 'widgets/kyc_base_form.dart';
import '../../../../core/presentation/buttons/button_pair.dart';

class KycSummaryScreen extends StatelessWidget {
  final BasicInformationState basicInformationState;
  final AddressProofState addressProofState;
  final CountryOfTaxResidenceState countryOfTaxResidenceState;
  final DisclosureAffiliationState disclosureAffiliationState;
  final double progress;

  const KycSummaryScreen(
      {required this.basicInformationState,
      required this.progress,
      required this.addressProofState,
      required this.countryOfTaxResidenceState,
      required this.disclosureAffiliationState,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Summary',
      content: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            PersonalInfoSummaryContent(
              key: const Key('personal_info_summary_content'),
              basicInformationState: basicInformationState,
              addressProofState: addressProofState,
              countryOfTaxResidenceState: countryOfTaxResidenceState,
              title: 'Personal Info',
            ),
            const SizedBox(
              height: 56,
            ),
            DisclosureSummaryContent(
              key: const Key('financial_profile_summary_content'),
              disclosureAffiliationState: disclosureAffiliationState,
              title: 'Financial Profile',
            ),
            const SizedBox(
              height: 56,
            ),
            const SignAgreementSummaryContent(
                key: Key('sign_agreement_summary_content'), title: 'Agreements')
          ],
        ),
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget _bottomButton(BuildContext context) => ButtonPair(
        primaryButtonOnClick: () => context
            .read<NavigationBloc<KycPageStep>>()
            .add(const PageChanged(KycPageStep.giftBotStock)),
        secondaryButtonOnClick: () => CarouselScreen.open(context),
        primaryButtonLabel: 'COMPLETE',
        secondaryButtonLabel: 'SAVE FOR LATER',
      );
}
