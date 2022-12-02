import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/address_proof/address_proof_bloc.dart';
import '../../bloc/basic_information/basic_information_bloc.dart';
import '../../bloc/country_of_tax_residence/country_of_tax_residence_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';
import 'widgets/personal_info_summary_content.dart';

class PersonalInfoSummaryScreen extends StatelessWidget {
  final BasicInformationState basicInformationState;
  final AddressProofState addressProofState;
  final CountryOfTaxResidenceState countryOfTaxResidenceState;
  final double progress;

  const PersonalInfoSummaryScreen(
      {required this.basicInformationState,
      required this.progress,
      required this.addressProofState,
      required this.countryOfTaxResidenceState,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Personal Info',
      content: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: PersonalInfoSummaryContent(
          key: const Key('personal_info_summary_content'),
          basicInformationState: basicInformationState,
          addressProofState: addressProofState,
          countryOfTaxResidenceState: countryOfTaxResidenceState,
          title: 'Summary',
        ),
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget _bottomButton(BuildContext context) => KycButtonPair(
        primaryButtonOnClick: () => context
            .read<NavigationBloc<KycPageStep>>()
            .add(const PageChanged(KycPageStep.disclosureAffiliationPerson)),
        secondaryButtonOnClick: () => CarouselScreen.open(context),
        primaryButtonLabel: 'CONFIRM & CONTINUE',
        secondaryButtonLabel: 'SAVE FOR LATER',
      );
}
