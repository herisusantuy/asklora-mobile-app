import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_image_picker.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/address_proof/address_proof_bloc.dart';
import '../../bloc/basic_information/basic_information_bloc.dart';
import '../../bloc/country_of_tax_residence/country_of_tax_residence_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';
import '../widgets/summary_text_info.dart';

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
      content: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          CustomText(
            'Summary',
            type: FontType.h4,
            padding: AppValues.screenHorizontalPadding.copyWith(bottom: 6),
          ),
          SummaryTextInfo(
              title:
                  'Are you a United States tax resident, green card holder or citizens ?',
              subTitle: basicInformationState.isUnitedStateResident != null
                  ? basicInformationState.isUnitedStateResident!
                      ? 'Yes'
                      : 'No'
                  : 'Unknown'),
          SummaryTextInfo(
              title: 'Are you a Hong Kong citizen or resident ?',
              subTitle:
                  basicInformationState.isHongKongPermanentResident != null
                      ? basicInformationState.isHongKongPermanentResident!
                          ? 'Yes'
                          : 'No'
                      : 'Unknown'),
          SummaryTextInfo(
              title: 'English First Name',
              subTitle: basicInformationState.firstName),
          SummaryTextInfo(
              title: 'English Last Name',
              subTitle: basicInformationState.lastName),
          SummaryTextInfo(title: 'Sex', subTitle: basicInformationState.gender),
          SummaryTextInfo(
              title: 'Day of Birth',
              subTitle: basicInformationState.dateOfBirth),
          SummaryTextInfo(
              title: 'Phone', subTitle: basicInformationState.phoneNumber),
          SummaryTextInfo(
              title: 'TIN Number', subTitle: countryOfTaxResidenceState.tinNumber),
          SummaryTextInfo(title: 'Address', subTitle: addressProofState.addressLine1),
          SummaryTextInfo(
              title: 'Address 2', subTitle: addressProofState.addressLine2),
          CustomImagePicker(padding: AppValues.screenHorizontalPadding,
            initialValue: addressProofState.addressProofImages,
            title: '',
            disabled: true,
          )
        ],
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
