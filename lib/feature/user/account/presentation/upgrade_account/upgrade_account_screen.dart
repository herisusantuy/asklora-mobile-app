import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_snack_bar.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/utils/storage/secure_storage.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/review_information/review_information_bloc.dart';
import '../../bloc/risk_disclosure/risk_disclosure_bloc.dart';
import '../../bloc/signing_agreement_tax/signing_agreement_tax_bloc.dart';
import '../../repository/account_repository.dart';
import 'address_proof_form.dart';
import 'basic_information_form.dart';
import 'country_of_tax_residence_form.dart';
import 'disclosures_affiliations_form.dart';
import 'financial_profile_form.dart';
import 'review_information_screen.dart';
import 'risk_disclosure_form.dart';
import 'signing_agreement_tax_form.dart';
import 'signing_broker_agreements_form.dart';
import 'trusted_contact_form.dart';

class UpgradeAccountScreen extends StatelessWidget {
  late final AccountBloc accountBloc;
  DateTime? currentBackPressTime;

  static const String route = '/upgrade_account_screen';
  final UpgradeAccountPageStep initialUpgradeAccountPages;

  UpgradeAccountScreen(
      {Key? key,
      this.initialUpgradeAccountPages =
          UpgradeAccountPageStep.basicInformation})
      : super(key: key) {
    accountBloc = AccountBloc(
      getAccountRepository: AccountRepository(),
      secureStorage: SecureStorage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationBloc(initialUpgradeAccountPages)),
        BlocProvider(create: (context) => accountBloc),
        BlocProvider(create: (context) => accountBloc.basicInformationBloc),
        BlocProvider(
            create: (context) => accountBloc.countryOfTaxResidenceBloc),
        BlocProvider(create: (context) => accountBloc.addressProofBloc),
        BlocProvider(create: (context) => accountBloc.financialProfileBloc),
        BlocProvider(
            create: (context) => accountBloc.disclosureAffiliationBloc),
        BlocProvider(
            create: (context) => accountBloc.signingBrokerAgreementBloc),
        BlocProvider(create: (context) => accountBloc.trustedContactBloc),
        BlocProvider(create: (context) => RiskDisclosureBloc()),
        BlocProvider(create: (context) => ReviewInformationBloc()),
        BlocProvider(create: (context) => SigningAgreementTaxBloc()),
      ],
      child: WillPopScope(
        onWillPop: () => onWillPop(context),
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              elevation: 0,
              automaticallyImplyLeading: false,
            ),
            body: BlocConsumer<NavigationBloc<UpgradeAccountPageStep>,
                NavigationState<UpgradeAccountPageStep>>(
              listenWhen: (_, current) => current.lastPage == true,
              listener: (context, state) => Navigator.pop(context),
              builder: (context, state) => SafeArea(
                child: Column(
                  key: const Key('upgrade_account_page'),
                  children: [
                    _headerUpgradeAccount,
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _pages(state),
                    )),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _pages(NavigationState navigationState) {
    switch (navigationState.page) {
      case UpgradeAccountPageStep.basicInformation:
        return BasicInformationForm();
      case UpgradeAccountPageStep.countryOfTaxResidence:
        return const CountryOfTaxResidenceForm();
      case UpgradeAccountPageStep.addressProof:
        return AddressProofForm();
      case UpgradeAccountPageStep.employmentFinancialProfile:
        return const FinancialProfileForm();
      case UpgradeAccountPageStep.disclosureAffiliation:
        return const DisclosuresAffiliationsForm();
      case UpgradeAccountPageStep.signingTaxAgreement:
        return const SigningAgreementTaxForm();
      case UpgradeAccountPageStep.signingBrokerAgreement:
        return SigningBrokerAgreementsForm();
      case UpgradeAccountPageStep.trustedContact:
        return const TrustedContactForm();
      case UpgradeAccountPageStep.riskDisclosure:
        return const RiskDisclosureForm();
      case UpgradeAccountPageStep.reviewInformation:
        return const ReviewInformationScreen();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget get _headerUpgradeAccount => Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: BlocBuilder<NavigationBloc<UpgradeAccountPageStep>,
            NavigationState<UpgradeAccountPageStep>>(
          builder: (context, state) {
            return Row(
              children: [
                InkWell(
                  onTap: () => context
                      .read<NavigationBloc<UpgradeAccountPageStep>>()
                      .add(const PagePop()),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.chevron_left_rounded,
                      size: 35,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: CustomText(state.page.name),
                )
              ],
            );
          },
        ),
      );

  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      CustomSnackBar(context)
          .setMessage('Press back again to go back to the title screen')
          .show();
      return Future.value(false);
    }
    return Future.value(true);
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
