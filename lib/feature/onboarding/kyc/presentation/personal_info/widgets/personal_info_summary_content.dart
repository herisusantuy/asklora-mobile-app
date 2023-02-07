import 'package:flutter/material.dart';

import '../../../../../../core/presentation/custom_image_picker.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../bloc/address_proof/address_proof_bloc.dart';
import '../../../bloc/basic_information/basic_information_bloc.dart';
import '../../../bloc/country_of_tax_residence/country_of_tax_residence_bloc.dart';
import '../../widgets/kyc_sub_title.dart';
import '../../widgets/summary_text_info.dart';

class PersonalInfoSummaryContent extends StatelessWidget {
  final String title;
  final BasicInformationState basicInformationState;
  final AddressProofState addressProofState;
  final CountryOfTaxResidenceState countryOfTaxResidenceState;

  const PersonalInfoSummaryContent(
      {Key? key,
      required this.basicInformationState,
      required this.addressProofState,
      required this.countryOfTaxResidenceState,
      required this.title})
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
              title:
                  'Are you a United States tax resident, green card holder or citizens ?',
              subTitle: basicInformationState.isUnitedStateResident != null
                  ? basicInformationState.isUnitedStateResident!
                      ? 'Yes'
                      : 'No'
                  : 'Unknown'),
          _spaceHeight,
          SummaryTextInfo(
              title:
                  'Are you a Hong Kong citizen or resident? By clicking yes, you acknowledge that you are also a Hong Kong tax resident',
              subTitle:
                  basicInformationState.isHongKongPermanentResident != null
                      ? basicInformationState.isHongKongPermanentResident!
                          ? 'Yes'
                          : 'No'
                      : 'Unknown'),
          _spaceHeight,
          SummaryTextInfo(
              title: 'English First Name',
              subTitle: basicInformationState.firstName),
          _spaceHeight,
          SummaryTextInfo(
              title: 'English Last Name',
              subTitle: basicInformationState.lastName),
          SummaryTextInfo(title: 'Sex', subTitle: basicInformationState.gender),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Day of Birth',
              subTitle: basicInformationState.dateOfBirth),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Country of Birth',
              subTitle: basicInformationState.countryOfBirth),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Phone', subTitle: basicInformationState.phoneNumber),
          _spaceHeight,
          SummaryTextInfo(
              title: 'HKID Number',
              subTitle: countryOfTaxResidenceState.tinNumber),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Address', subTitle: addressProofState.addressLine1),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Address 2', subTitle: addressProofState.addressLine2),
          _spaceHeight,
          CustomImagePicker(
            initialValue: addressProofState.addressProofImages,
            title: 'Address Proof',
            titleColor: AskLoraColors.gray,
            disabled: true,
          )
        ],
      );
}
