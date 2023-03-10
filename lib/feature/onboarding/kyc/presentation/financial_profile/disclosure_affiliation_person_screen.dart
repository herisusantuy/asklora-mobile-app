import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
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

  static const double _spaceHeightDouble = 20;
  final SizedBox _spaceHeight = const SizedBox(height: _spaceHeightDouble);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Financial Profile',
      content: Column(
        children: [
          const FinancialQuestion(
            'Do any of the following apply to you or a member of your immediate family ?',
          ),
          _spaceHeight,
          const DotText(
              'I am a senior executive at or a 10% or greater shareholder of a publicly traded company.'),
          _spaceHeight,
          const DotText('I am a senior political figure.'),
          _spaceHeight,
          const DotText('I am a senior political figure.'),
          _spaceHeight,
          const DotText(
              'I am a family member or relative of a senior political figure.'),
          _spaceHeight,
          const DotText(
              'I am a director/employee/licensed person of a licensed corporation registered with the HK Securities and Futures Commission.'),
        ],
      ),
      bottomButton:
          BlocBuilder<DisclosureAffiliationBloc, DisclosureAffiliationState>(
              buildWhen: (previous, current) =>
                  previous.isAffiliatedPerson != current.isAffiliatedPerson,
              builder: (context, state) => ChoicesButton(
                    initialValue: state.isAffiliatedPerson != null
                        ? state.isAffiliatedPerson!
                            ? 'yes'
                            : 'no'
                        : 'unknown',
                    key: const Key('choices_button'),
                    onAnswerYes: () {
                      context
                          .read<DisclosureAffiliationBloc>()
                          .add(const AffiliatedPersonChanged(true));
                      context.read<NavigationBloc<KycPageStep>>().add(
                          const PageChanged(KycPageStep.disclosureRejected));
                    },
                    onAnswerNo: () {
                      context
                          .read<DisclosureAffiliationBloc>()
                          .add(const AffiliatedPersonChanged(false));
                      context.read<NavigationBloc<KycPageStep>>().add(
                          const PageChanged(
                              KycPageStep.financialProfileEmployment));
                    },
                    onSaveForLater: () => CarouselScreen.open(context),
                  )),
      progress: progress,
    );
  }
}
