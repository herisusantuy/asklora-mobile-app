import 'package:flutter/material.dart';

import '../../../../../../core/presentation/custom_image_picker.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../bloc/address_proof/address_proof_bloc.dart';
import '../../../bloc/country_of_tax_residence/country_of_tax_residence_bloc.dart';
import '../../../bloc/personal_info/personal_info_bloc.dart';
import '../../widgets/kyc_sub_title.dart';
import '../../widgets/summary_text_info.dart';

class PersonalInfoSummaryContent extends StatelessWidget {
  final String title;
  final PersonalInfoState personalInfoState;
  final AddressProofState addressProofState;
  final CountryOfTaxResidenceState countryOfTaxResidenceState;

  const PersonalInfoSummaryContent(
      {Key? key,
      required this.personalInfoState,
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
              subTitle: personalInfoState.isUnitedStateResident != null
                  ? personalInfoState.isUnitedStateResident!
                      ? 'Yes'
                      : 'No'
                  : 'Unknown'),
          _spaceHeight,
          SummaryTextInfo(
              title:
                  'Are you a Hong Kong citizen or resident? By clicking yes, you acknowledge that you are also a Hong Kong tax resident',
              subTitle: personalInfoState.isHongKongPermanentResident != null
                  ? personalInfoState.isHongKongPermanentResident!
                      ? 'Yes'
                      : 'No'
                  : 'Unknown'),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Legal English First Name',
              subTitle: personalInfoState.firstName),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Legal English Last Name',
              subTitle: personalInfoState.lastName),
          _spaceHeight,
          SummaryTextInfo(title: 'Gender', subTitle: personalInfoState.gender),
          _spaceHeight,
          SummaryTextInfo(
              title: 'HKID Number', subTitle: personalInfoState.hkIdNumber),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Nationality',
              subTitle: personalInfoState.nationalityName),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Date of Birth',
              subTitle: personalInfoState.dateOfBirth.replaceAll('-', '/')),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Country of Birth',
              subTitle: personalInfoState.countryNameOfBirth),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Phone',
              subTitle:
                  '+${personalInfoState.phoneCountryCode} ${personalInfoState.phoneNumber}'),
          _spaceHeight,
          SummaryTextInfo(
              title: 'Address', subTitle: addressProofState.addressLine1),
          if (addressProofState.addressLine2.isNotEmpty)
            SummaryTextInfo(
                title: null, subTitle: addressProofState.addressLine2),
          if (addressProofState.region != null)
            SummaryTextInfo(
                title: null, subTitle: addressProofState.region!.value),
          if (addressProofState.district != null)
            SummaryTextInfo(
                title: null, subTitle: addressProofState.district!.value),
          _spaceHeight,
          CustomImagePicker(
            initialValue: addressProofState.addressProofImages,
            title: 'Address Proof',
            titleColor: AskLoraColors.gray,
            disabled: true,
          ),
        ],
      );
}
