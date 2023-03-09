import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../welcome/carousel/presentation/carousel_screen.dart';
import '../bloc/address_proof/address_proof_bloc.dart';
import '../bloc/country_of_tax_residence/country_of_tax_residence_bloc.dart';
import '../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../bloc/financial_profile/financial_profile_bloc.dart';
import '../bloc/kyc_bloc.dart';
import '../bloc/personal_info/personal_info_bloc.dart';
import '../bloc/source_of_wealth/source_of_wealth_bloc.dart';
import '../domain/upgrade_account/affiliated_person.dart';
import '../domain/upgrade_account/employment_info.dart';
import '../domain/upgrade_account/proofs_of_address_request.dart';
import '../domain/upgrade_account/residence_info_request.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';
import '../domain/upgrade_account/wealth_sources_request.dart';
import 'financial_profile/widgets/financial_profile_summary_content.dart';
import 'personal_info/widgets/personal_info_summary_content.dart';
import 'sign_agreements/widgets/sign_agreement_summary_content.dart';
import 'widgets/kyc_base_form.dart';

class KycSummaryScreen extends StatelessWidget {
  final PersonalInfoState personalInfoState;
  final AddressProofState addressProofState;
  final CountryOfTaxResidenceState countryOfTaxResidenceState;
  final DisclosureAffiliationState disclosureAffiliationState;
  final FinancialProfileState financialProfileState;
  final SourceOfWealthState sourceOfWealthState;
  final double progress;

  const KycSummaryScreen(
      {required this.personalInfoState,
      required this.progress,
      required this.addressProofState,
      required this.countryOfTaxResidenceState,
      required this.disclosureAffiliationState,
      required this.financialProfileState,
      required this.sourceOfWealthState,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Summary',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersonalInfoSummaryContent(
            key: const Key('personal_info_summary_content'),
            personalInfoState: personalInfoState,
            addressProofState: addressProofState,
            countryOfTaxResidenceState: countryOfTaxResidenceState,
            title: 'Personal Info',
          ),
          const SizedBox(
            height: 56,
          ),
          FinancialProfileSummaryContent(
            key: const Key('financial_profile_summary_content'),
            disclosureAffiliationState: disclosureAffiliationState,
            financialProfileState: financialProfileState,
            sourceOfWealthState: sourceOfWealthState,
            title: 'Financial Profile',
          ),
          const SizedBox(
            height: 56,
          ),
          const SignAgreementSummaryContent(
              key: Key('sign_agreement_summary_content'), title: 'Agreements'),
          const SizedBox(height: 50),
          const CustomTextNew(
            'The agreements will become binding subject to the approval of the information submitted by you. ',
            textAlign: TextAlign.center,
          )
        ],
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget _bottomButton(BuildContext context) => BlocListener<KycBloc, KycState>(
        listenWhen: (previous, current) =>
            previous.response.state != current.response.state,
        listener: (context, state) {
          if (state.response.state == ResponseState.loading) {
            CustomLoadingOverlay.of(context).show();
          } else {
            CustomLoadingOverlay.of(context).dismiss();
          }
          switch (state.response.state) {
            case ResponseState.error:
              CustomInAppNotification.show(context, state.response.message);
              break;
            case ResponseState.success:
              context
                  .read<AppBloc>()
                  .add(const SaveUserJourney(UserJourney.freeBotStock));
              context
                  .read<NavigationBloc<KycPageStep>>()
                  .add(const PageChanged(KycPageStep.kycResultScreen));
              break;
            default:
              break;
          }
        },
        child: ButtonPair(
          primaryButtonOnClick: () {
            context.read<KycBloc>().add(_submitKyc(addressProofState));
          },
          secondaryButtonOnClick: () => CarouselScreen.open(context),
          primaryButtonLabel: 'COMPLETE',
          secondaryButtonLabel: 'SAVE FOR LATER',
        ),
      );

  SubmitKyc _submitKyc(AddressProofState addressProofState) {
    return SubmitKyc(UpgradeAccountRequest(
        residenceInfo: ResidenceInfoRequest(
          addressLine1: addressProofState.addressLine1,
          addressLine2: addressProofState.addressLine2,
          district: addressProofState.district?.value,
          region: addressProofState.region?.value,
        ),
        // proofsOfAddress: proofsOfAddressRequests,
        proofsOfAddress: addressProofState.addressProofImages.map((e) {
          return ProofsOfAddressRequest(proofFile: base64Image(e));
        }).toList(),
        employmentInfo: EmploymentInfo(
            employmentStatus: financialProfileState.employmentStatus.enumString,
            employer: financialProfileState.employer,
            employerBusiness: financialProfileState.natureOfBusiness?.value,
            employerBusinessDescription:
                financialProfileState.natureOfBusinessDescription,
            occupation: financialProfileState.occupation?.value,
            employerAddressLine1: financialProfileState.employerAddress,
            employerAddressLine2: financialProfileState.employerAddressTwo,
            district: financialProfileState.district?.value,
            region: financialProfileState.region?.value,
            country: financialProfileState.country,
            differentCountryReason:
                financialProfileState.detailInformationOfCountry),
        wealthSources: sourceOfWealthState.sourceOfWealthAnswers
            .map((e) => WealthSourcesRequest(
                  wealthSource: e.sourceOfWealthType.value,
                  percentage: e.amount,
                ))
            .toList(),
        affiliatedPerson: disclosureAffiliationState
                    .affiliatedPersonFirstName.isEmpty &&
                disclosureAffiliationState.affiliatedPersonLastName.isEmpty
            ? null
            : AffiliatedPerson(
                firstName: disclosureAffiliationState.affiliatedPersonFirstName,
                lastName: disclosureAffiliationState.affiliatedPersonLastName,
              )));
  }

  String base64Image(PlatformFile e) {
    final bytes = File(e.path!).readAsBytesSync();
    String result = 'data:image/png;base64,${base64Encode(bytes)}';
    return result;
  }
}
