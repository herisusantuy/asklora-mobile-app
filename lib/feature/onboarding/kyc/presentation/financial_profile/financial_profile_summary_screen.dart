import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../../bloc/financial_profile/financial_profile_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../../bloc/source_of_wealth/source_of_wealth_bloc.dart';
import '../../domain/upgrade_account/save_kyc_request.dart';
import '../widgets/kyc_base_form.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import 'widgets/financial_profile_summary_content.dart';

class FinancialProfileSummaryScreen extends StatelessWidget {
  final DisclosureAffiliationState disclosureAffiliationState;
  final FinancialProfileState financialProfileState;
  final SourceOfWealthState sourceOfWealthState;
  final double progress;

  const FinancialProfileSummaryScreen(
      {required this.disclosureAffiliationState,
      required this.financialProfileState,
      required this.sourceOfWealthState,
      required this.progress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Financial Profile',
      content: FinancialProfileSummaryContent(
        key: const Key('financial_profile_summary_content'),
        disclosureAffiliationState: disclosureAffiliationState,
        financialProfileState: financialProfileState,
        sourceOfWealthState: sourceOfWealthState,
        title: 'Summary',
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget _bottomButton(BuildContext context) => ButtonPair(
        primaryButtonOnClick: () => context
            .read<NavigationBloc<KycPageStep>>()
            .add(const PageChanged(KycPageStep.signTaxAgreements)),
        secondaryButtonOnClick: () => context
            .read<KycBloc>()
            .add(SaveKyc(SaveKycRequest.getRequestForSavingKyc(context))),
        primaryButtonLabel: 'CONFIRM & CONTINUE',
        secondaryButtonLabel: 'SAVE FOR LATER',
      );
}
