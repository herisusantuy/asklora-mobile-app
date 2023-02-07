import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signature/signature.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../bloc/address_proof/address_proof_bloc.dart';
import '../bloc/basic_information/basic_information_bloc.dart';
import '../bloc/country_of_tax_residence/country_of_tax_residence_bloc.dart';
import '../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../bloc/kyc_bloc.dart';
import '../bloc/signing_agreement/signing_agreement_bloc.dart';
import '../bloc/financial_profile/financial_profile_bloc.dart';
import '../repository/account_repository.dart';
import '../repository/signing_broker_agreement_repository.dart';
import 'financial_profile/disclosure_affiliation_associates_screen.dart';
import 'financial_profile/disclosure_affiliation_commission_screen.dart';
import 'financial_profile/disclosure_affiliation_input_screen/disclosure_affiliation_associates_input_screen.dart';
import 'financial_profile/disclosure_affiliation_input_screen/disclosure_affiliation_person_input_screen.dart';
import 'financial_profile/disclosure_affiliation_person_screen.dart';
import 'financial_profile/disclosure_summary_screen.dart';
import 'financial_profile/financial_profile_employment_question.dart';
import 'kyc_result_screen.dart';
import 'kyc_progress/kyc_progress_screen.dart';
import 'kyc_rejected_screen.dart';
import 'kyc_summary_screen.dart';
import 'personal_info/address_proof_screen.dart';
import 'personal_info/basic_information_screen.dart';
import 'personal_info/otp/bloc/otp_bloc.dart';
import 'personal_info/otp/presentation/otp_screen.dart';
import 'personal_info/otp/repository/otp_repository.dart';
import 'personal_info/personal_info_summary_screen.dart';
import 'personal_info/resident_check_screen.dart';
import 'personal_info/tin_screen.dart';
import 'sign_agreements/broker_agreement_screen.dart';
import 'sign_agreements/risk_disclosure_agreement_screen.dart';
import 'sign_agreements/tax_agreement_screen.dart';
import 'verify_identity/verify_identity_screen.dart';

class KycScreen extends StatelessWidget {
  static const String route = '/kyc_screen';
  final KycPageStep initialKycPageStep;

  const KycScreen({this.initialKycPageStep = KycPageStep.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        enableBackNavigation: false,
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
              BlocProvider(
                create: (context) => FinancialProfileBloc(),
              ),
              BlocProvider(
                create: (context) =>
                    KycBloc(getAccountRepository: AccountRepository()),
              ),
              BlocProvider(
                create: (context) => SigningAgreementBloc(
                    signingBrokerAgreementRepository:
                        SigningBrokerAgreementRepository(),
                    signatureController: SignatureController()),
              ),
            ],
            child: Builder(builder: (context) {
              return CustomNavigationWidget<KycPageStep>(
                padding: EdgeInsets.zero,
                header: const SizedBox.shrink(),
                onBackPressed: () {
                  context
                      .read<NavigationBloc<KycPageStep>>()
                      .add(const PagePop());
                },
                child:
                    BlocListener<NavigationBloc<KycPageStep>, NavigationState>(
                        listenWhen: (_, current) => current.lastPage == true,
                        listener: (context, state) => Navigator.pop(context),
                        child: _getPages),
              );
            })));
  }

  Widget get _getPages {
    return BlocBuilder<NavigationBloc<KycPageStep>, NavigationState>(
        buildWhen: (previous, current) => previous.page != current.page,
        builder: (context, state) {
          switch (state.page) {
            case KycPageStep.progress:
              return const KycProgressScreen(
                currentStep: 1,
              );
            case KycPageStep.residentCheck:
              return const ResidentCheckScreen(
                progress: 0.05,
              );
            case KycPageStep.personalInfoRejected:
              return const KycRejectedScreen(
                rejectedReason:
                    'Currently only eligible for Hong Kong Resident and Non-US Citizens.',
              );
            case KycPageStep.basicInformation:
              return const BasicInformationScreen(
                progress: 0.1,
              );
            case KycPageStep.otp:
              return const OtpScreen(
                email: 'raviranjan@asifboot.com',
                progress: 0.15,
              );
            case KycPageStep.tin:
              return const TinScreen(
                progress: 0.2,
              );
            case KycPageStep.addressProof:
              return const AddressProofScreen(
                progress: 0.25,
              );
            case KycPageStep.personalInfoSummary:
              return PersonalInfoSummaryScreen(
                basicInformationState:
                    context.read<BasicInformationBloc>().state,
                progress: 0.3,
                addressProofState: context.read<AddressProofBloc>().state,
                countryOfTaxResidenceState:
                    context.read<CountryOfTaxResidenceBloc>().state,
              );
            case KycPageStep.disclosureAffiliationPerson:
              return const DisclosureAffiliationPersonScreen(
                progress: 0.35,
              );
            case KycPageStep.disclosureAffiliationPersonInput:
              return DisclosureAffiliationPersonInputScreen(
                progress: 0.4,
                disclosureAffiliationState:
                    context.read<DisclosureAffiliationBloc>().state,
              );
            case KycPageStep.disclosureAffiliationAssociates:
              return const DisclosureAffiliationAssociatesScreen(
                progress: 0.45,
              );
            case KycPageStep.disclosureAffiliationAssociatesInput:
              return DisclosureAffiliationAssociatesInputScreen(
                progress: 0.5,
                disclosureAffiliationState:
                    context.read<DisclosureAffiliationBloc>().state,
              );
            case KycPageStep.disclosureAffiliationCommissions:
              return const DisclosureAffiliationCommissionScreen(
                progress: 0.6,
              );
            case KycPageStep.financialProfileEmployment:
              return const FinancialProfileEmploymentQuestion(
                progress: 0.62,
              );
            case KycPageStep.disclosureSummary:
              return DisclosureSummaryScreen(
                progress: 0.65,
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
                progress: 0.7,
              );
            case KycPageStep.signBrokerAgreements:
              return const BrokerAgreementScreen(
                progress: 0.75,
              );
            case KycPageStep.signRiskDisclosureAgreements:
              return const RiskDisclosureAgreementScreen(
                progress: 0.8,
              );
            case KycPageStep.signTaxAgreements:
              return const TaxAgreementScreen(
                progress: 0.85,
              );
            case KycPageStep.kycSummary:
              return KycSummaryScreen(
                basicInformationState:
                    context.read<BasicInformationBloc>().state,
                progress: 0.9,
                addressProofState: context.read<AddressProofBloc>().state,
                countryOfTaxResidenceState:
                    context.read<CountryOfTaxResidenceBloc>().state,
                disclosureAffiliationState:
                    context.read<DisclosureAffiliationBloc>().state,
              );
            case KycPageStep.kycResultScreen:
              return const KycResultScreen();
            default:
              return const SizedBox.shrink();
          }
        });
  }

  static void open(BuildContext context) => Navigator.pushNamed(
        context,
        route,
      );
}
