import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';
import 'widgets/disclosure_summary_content.dart';

class DisclosureSummaryScreen extends StatelessWidget {
  final DisclosureAffiliationState disclosureAffiliationState;
  final double progress;

  const DisclosureSummaryScreen(
      {required this.disclosureAffiliationState,
      required this.progress,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Financial Profile',
      content: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: DisclosureSummaryContent(
          key: const Key('disclosure_summary_content'),
          disclosureAffiliationState: disclosureAffiliationState,
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
            .add(const PageChanged(KycPageStep.verifyIdentity)),
        secondaryButtonOnClick: () => CarouselScreen.open(context),
        primaryButtonLabel: 'CONFIRM & CONTINUE',
        secondaryButtonLabel: 'SAVE FOR LATER',
      );
}
