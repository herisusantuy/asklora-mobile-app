import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/address_proof/bloc/address_proof_bloc.dart';
import '../../bloc/basic_information/bloc/basic_information_bloc.dart';
import '../../bloc/country_of_tax_residence/bloc/country_of_tax_residence_bloc.dart';
import '../../bloc/disclosure_affiliation/bloc/disclosure_affiliation_bloc.dart';
import '../../bloc/financial_profile/bloc/financial_profile_bloc.dart';
import '../../bloc/risk_disclosure/risk_disclosure_bloc.dart';
import '../../bloc/signing_agreement_tax/signing_agreement_tax_bloc.dart';
import '../../bloc/signing_broker_agreement/bloc/signing_broker_agreement_bloc.dart';
import '../../bloc/trusted_contact/bloc/trusted_contact_bloc.dart';
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
  UpgradeAccountScreen({Key? key, required this.initialPage})
      : _pageViewController = PageController(initialPage: initialPage),
        super(key: key);

  final int initialPage;

  final PageController _pageViewController;

  List<Widget> get _pages => [
        BasicInformationForm(
          key: const Key('basic_information_step'),
          controller: _pageViewController,
        ),
        CountryOfTaxResidenceForm(
            key: const Key('country_of_tax_residence_step'),
            controller: _pageViewController),
        AddressProofForm(
          key: const Key('address_proof_step'),
          controller: _pageViewController,
        ),
        FinancialProfileForm(
            key: const Key('financial_profile_step'),
            controller: _pageViewController),
        DisclosuresAffiliationsForm(
          key: const Key('disclosures_affiliations_step'),
          controller: _pageViewController,
        ),
        SigningAgreementTaxForm(
            key: const Key('signing_agreement_tax_step'),
            controller: _pageViewController),
        SigningBrokerAgreementsForm(
          key: const Key('signing_broker_agreement_step'),
          controller: _pageViewController,
        ),
        TrustedContactForm(
          key: const Key('trusted_contact_step'),
          controller: _pageViewController,
        ),
        RiskDisclosureForm(
            key: const Key('risk_disclosure_step'),
            controller: _pageViewController),
        ReviewInformationScreen(
            key: const Key('review_information_step'),
            controller: _pageViewController),
      ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          automaticallyImplyLeading: false,
          title: const CustomText('Upgrade Account'),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  AccountBloc(getAccountRepository: AccountRepository()),
            ),
            BlocProvider(create: (context) => BasicInformationBloc()),
            BlocProvider(create: (context) => CountryOfTaxResidenceBloc()),
            BlocProvider(create: (context) => AddressProofBloc()),
            BlocProvider(create: (context) => FinancialProfileBloc()),
            BlocProvider(create: (context) => DisclosureAffiliationBloc()),
            BlocProvider(create: (context) => SigningAgreementTaxBloc()),
            BlocProvider(create: (context) => SigningBrokerAgreementBloc()),
            BlocProvider(create: (context) => TrustedContactBloc()),
            BlocProvider(create: (context) => RiskDisclosureBloc()),
          ],
          child: SafeArea(
              child: Column(
            children: [
              _headerUpgradeAccount(),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: PageView(
                    key: const Key('upgrade_account_page_view'),
                    controller: _pageViewController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: _pages,
                  ),
                ),
              ),
            ],
          )),
        ),
      );

  Widget _headerUpgradeAccount() => Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    context
                        .read<AccountBloc>()
                        .add(const AccountCurrentStepChanged('back'));
                    _pageViewController.previousPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  },
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
                  child: CustomText(state.currentStepName),
                )
              ],
            );
          },
        ),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => UpgradeAccountScreen(
                initialPage: 0,
              )));
}
