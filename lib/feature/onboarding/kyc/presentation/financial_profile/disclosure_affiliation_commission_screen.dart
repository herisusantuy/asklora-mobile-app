import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/kyc_base_form.dart';
import 'widgets/choices_button.dart';
import 'widgets/financial_question.dart';

class DisclosureAffiliationCommissionScreen extends StatelessWidget {
  final double progress;

  const DisclosureAffiliationCommissionScreen(
      {required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Financial Profile',
      content:
          BlocListener<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        listener: (BuildContext context, state) => context
            .read<NavigationBloc<KycPageStep>>()
            .add(PageChanged(state.isAffiliatedCommission!
                ? KycPageStep.disclosureRejected
                : KycPageStep.disclosureSummary)),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: const [
            FinancialQuestion(
              'Are your immediate family or/and you a director, employee, or licensed person registered with the Hong Kong Securities and Futures Commission.',
            ),
          ],
        ),
      ),
      bottomButton: ChoicesButton(
        key: const Key('choices_button'),
        onAnswerYes: () => context
            .read<DisclosureAffiliationBloc>()
            .add(const AffiliatedCommissionChanged(true)),
        onAnswerNo: () => context
            .read<DisclosureAffiliationBloc>()
            .add(const AffiliatedCommissionChanged(false)),
        onSaveForLater: () => CarouselScreen.open(context),
      ),
      progress: progress,
    );
  }
}
