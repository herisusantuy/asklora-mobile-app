import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../financial_profile/widgets/dot_text.dart';
import '../widgets/kyc_base_form.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../widgets/kyc_sub_title.dart';

class TaxAgreementScreen extends StatelessWidget {
  final double progress;

  const TaxAgreementScreen({required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Sign Agreements',
      content: ListView(
        padding: const EdgeInsets.symmetric(vertical: 32),
        children: [
          KycSubTitle(
            key: const Key('sub_title'),
            subTitle: 'US Tax Form',
          ),
          const CustomText(
            'Under penalties of perjury, I declare that I have examined the information on this form and to the best of my knowledge and belief it is true, correct, and complete. I further certify under penalties of perjury that:',
            key: Key('statements'),
            type: FontType.smallText,
            padding: AppValues.screenHorizontalPadding,
            height: 1.6,
          ),
          _dotText(
              'I am the individual that is the beneficial owner (or am authorized to sign for the individual that is the beneficial owner) of all the income or proceeds to which this form relates or am using this form to document myself for chapter 4 purposes;'),
          _dotText(
              'The person named on line 1 of this form is not a U.S. person;'),
          _dotText('This form relates to:'),
          _dotTextSlightRight(
              '(a) income not effectively connected with the conduct of a trade or business in the United States;'),
          _dotTextSlightRight(
              '(b) income effectively connected with the conduct of a trade or business in the United States but is not subject to tax under an applicable income tax treaty;'),
          _dotTextSlightRight(
              '(c) the partner’s share of a partnership’s effectively connected taxable income; or'),
          _dotTextSlightRight(
              '(d) the partner’s amount realized from the transfer of a partnership interest subject to withholding under section 1446(f);'),
          _dotText(
              'The person named on line 1 of this form is a resident of the treaty country listed on line 9 of the form (if any) within the meaning of the income tax treaty between the United States and that country; and'),
          _dotText(
              'For broker transactions or barter exchanges, the beneficial owner is an exempt foreign person as defined in the instructions.'),
          CustomText(
            'Furthermore, I authorize this form to be provided to any withholding agent that has control, receipt, or custody of the income of which I am the beneficial owner or any withholding agent that can disburse or make payments of the income of which I am the beneficial owner. I agree that I will submit a new form within 30 days if any certification made on this form becomes incorrect.',
            type: FontType.smallText,
            padding: AppValues.screenHorizontalPadding.copyWith(top: 6),
            height: 1.6,
          ),
        ],
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget _dotText(String text) => DotText(
        text,
        fontHeight: 1.6,
      );

  Widget _dotTextSlightRight(String text) => DotText(
        text,
        fontHeight: 1.6,
      );

  Widget _bottomButton(BuildContext context) => ButtonPair(
        primaryButtonOnClick: () => context
            .read<NavigationBloc<KycPageStep>>()
            .add(const PageChanged(KycPageStep.kycSummary)),
        secondaryButtonOnClick: () => CarouselScreen.open(context),
        primaryButtonLabel: 'AGREE',
        secondaryButtonLabel: 'CONTINUE LATER',
      );
}
