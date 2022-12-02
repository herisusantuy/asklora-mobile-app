import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/disclosure_affiliation/disclosure_affiliation_bloc.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/kyc_base_form.dart';
import 'widgets/choices_button.dart';
import 'widgets/dot_text.dart';
import 'widgets/financial_question.dart';

class DisclosureAffiliationPersonScreen extends StatelessWidget {
  final double progress;

  const DisclosureAffiliationPersonScreen({required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Financial Profile',
      content:
          BlocListener<DisclosureAffiliationBloc, DisclosureAffiliationState>(
        listenWhen: (previous, current) =>
            previous.isAffiliatedPerson != current.isAffiliatedPerson,
        listener: (BuildContext context, state) => context
            .read<NavigationBloc<KycPageStep>>()
            .add(PageChanged(state.isAffiliatedPerson!
                ? KycPageStep.disclosureAffiliationPersonInput
                : KycPageStep.disclosureAffiliationAssociates)),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          children: [
            const FinancialQuestion(
              'Do any of the following apply to you or a member of your immediate family ?',
            ),
            _dotText(
              'I am affiliated or work with US registered broker-dealer or FINRA.',
            ),
            _dotText(
                'I am a senior executive at or a 10% or greater shareholder of a publicly traded company.'),
            _dotText('I am a senior political figure.'),
            _dotText(
                'I am a family member or relative of a senior political figure.'),
            _dotText(
                'I am a director, employee, or licensed person registered with the Hong Kong Securities and Futures Commission.'),
          ],
        ),
      ),
      bottomButton: ChoicesButton(
        key: const Key('choices_button'),
        onAnswerYes: () => context
            .read<DisclosureAffiliationBloc>()
            .add(const AffiliatedPersonChanged(true)),
        onAnswerNo: () => context
            .read<DisclosureAffiliationBloc>()
            .add(const AffiliatedPersonChanged(false)),
        onSaveForLater: () => CarouselScreen.open(context),
      ),
      progress: progress,
    );
  }

  Widget _dotText(String text) => DotText(text,
      padding: AppValues.screenHorizontalPadding.copyWith(top: 24));
}
