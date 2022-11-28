import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/we_create/custom_app_bar.dart';
import '../bloc/address_proof/address_proof_bloc.dart';
import '../bloc/basic_information/basic_information_bloc.dart';
import '../bloc/country_of_tax_residence/country_of_tax_residence_bloc.dart';
import '../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../bloc/kyc_bloc.dart';
import 'financial_profile/disclosure_affiliation_associates_screen.dart';
import 'financial_profile/disclosure_affiliation_commission_screen.dart';
import 'financial_profile/disclosure_affiliation_input_screen/disclosure_affiliation_associates_input_screen.dart';
import 'financial_profile/disclosure_affiliation_input_screen/disclosure_affiliation_person_input_screen.dart';
import 'financial_profile/disclosure_affiliation_person_screen.dart';
import 'financial_profile/disclosure_summary_screen.dart';
import 'kyc_progress/kyc_progress_screen.dart';
import 'kyc_rejected_screen.dart';
import 'personal_info/address_proof_screen.dart';
import 'personal_info/basic_information_screen.dart';
import 'personal_info/otp/bloc/otp_bloc.dart';
import 'personal_info/otp/presentation/otp_screen.dart';
import 'personal_info/otp/repository/otp_repository.dart';
import 'personal_info/personal_info_summary_screen.dart';
import 'personal_info/resident_check_screen.dart';
import 'personal_info/tin_screen.dart';
import 'verify_identity/verify_identity_screen.dart';

class KycScreen extends StatelessWidget {
  final KycPageStep initialKycPageStep;

  const KycScreen({this.initialKycPageStep = KycPageStep.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.transparentMinimal(),
        body: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) =>
                      NavigationBloc<KycPageStep>(initialKycPageStep)),
              BlocProvider(create: (_) => BasicInformationBloc()),
              BlocProvider(
                create: (context) => OtpBloc(otpRepository: OtpRepository()),
              ),
              BlocProvider(
                create: (context) => CountryOfTaxResidenceBloc(),
              ),
              BlocProvider(
                create: (context) => AddressProofBloc(),
              ),
              BlocProvider(
                create: (context) => DisclosureAffiliationBloc(),
              ),
            ],
            child: BlocListener<NavigationBloc<KycPageStep>, NavigationState>(
                listenWhen: (_, current) => current.lastPage == true,
                listener: (context, state) => Navigator.pop(context),
                child: _getPages)));
  }

  Widget get _getPages {
    return BlocBuilder<NavigationBloc<KycPageStep>, NavigationState>(
        buildWhen: (previous, current) => previous.page != current.page,
        builder: (context, state) {
          switch (state.page) {
            case KycPageStep.progress:
              return const KycProgressScreen();
            case KycPageStep.residentCheck:
              return const ResidentCheckScreen(
                progress: 0.1,
              );
            case KycPageStep.personalInfoRejected:
              return const KycRejectedScreen(
                rejectedReason:
                    'Currently only eligible for Hong Kong Resident and Non-US Citizens.',
              );
            case KycPageStep.basicInformation:
              return const BasicInformationScreen(
                progress: 0.2,
              );
            case KycPageStep.otp:
              return const OtpScreen(
                email: 'raviranjan@asifboot.com',
                progress: 0.3,
              );
            case KycPageStep.tin:
              return const TinScreen(
                progress: 0.4,
              );
            case KycPageStep.addressProof:
              return const AddressProofScreen(
                progress: 0.5,
              );
            case KycPageStep.personalInfoSummary:
              return PersonalInfoSummaryScreen(
                basicInformationState:
                    context.read<BasicInformationBloc>().state,
                progress: 0.6,
                addressProofState: context.read<AddressProofBloc>().state,
                countryOfTaxResidenceState:
                    context.read<CountryOfTaxResidenceBloc>().state,
              );
            case KycPageStep.disclosureAffiliationPerson:
              return const DisclosureAffiliationPersonScreen(
                progress: 0.7,
              );
            case KycPageStep.disclosureAffiliationPersonInput:
              return const DisclosureAffiliationPersonInputScreen(
                progress: 0.75,
              );
            case KycPageStep.disclosureAffiliationAssociates:
              return const DisclosureAffiliationAssociatesScreen(
                progress: 0.75,
              );
            case KycPageStep.disclosureAffiliationAssociatesInput:
              return const DisclosureAffiliationAssociatesInputScreen(
                progress: 0.75,
              );
            case KycPageStep.disclosureAffiliationCommissions:
              return const DisclosureAffiliationCommissionScreen(
                progress: 0.8,
              );
            case KycPageStep.disclosureSummary:
              return DisclosureSummaryScreen(
                progress: 0.8,
                disclosureAffiliationState:
                    context.read<DisclosureAffiliationBloc>().state,
              );
            case KycPageStep.disclosureRejected:
              return const KycRejectedScreen(
                rejectedReason:
                    'Employees of the SFC consectetur adipiscing elit. Viverra in diam tortor.',
              );
            case KycPageStep.verifyIdentity:
              return const VerifyIdentityScreen(
                progress: 0.8,
              );
            default:
              return const SizedBox.shrink();
          }
        });
  }
}
