import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/kyc_base_form.dart';
import 'widgets/choices_button.dart';
import 'widgets/financial_question.dart';

class DisclosureAffiliationAssociatesScreen extends StatelessWidget {
  final double progress;

  const DisclosureAffiliationAssociatesScreen(
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
            .add(PageChanged(state.isAffiliatedAssociates!
                ? KycPageStep.disclosureAffiliationAssociatesInput
                : KycPageStep.disclosureAffiliationCommissions)),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: const [
            FinancialQuestion(
              'Are your immediate family or/and you affiliated with any director, office or employee if LORA Technologies Limited ot its associates?',
            ),
          ],
        ),
      ),
      bottomButton: ChoicesButton(
        onAnswerYes: () => context
            .read<DisclosureAffiliationBloc>()
            .add(const AffiliateAssociatesChanged(true)),
        onAnswerNo: () => context
            .read<DisclosureAffiliationBloc>()
            .add(const AffiliateAssociatesChanged(false)),
        onSaveForLater: () => CarouselScreen.open(context),
      ),
      progress: progress,
    );
  }
}
