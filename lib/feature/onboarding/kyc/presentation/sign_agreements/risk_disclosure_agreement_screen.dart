import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../../bloc/signing_agreement/signing_agreement_bloc.dart';
import '../widgets/custom_silver_box.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';
import '../widgets/kyc_sub_title.dart';

class RiskDisclosureAgreementScreen extends StatelessWidget {
  final double progress;

  const RiskDisclosureAgreementScreen({required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Sign Agreements',
      content: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          _licenseeProfile,
          KycSubTitle(
            key: const Key('sub_title'),
            subTitle: 'Risk Disclosure Statement',
          ),
          const CustomText(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a, elementum enim a elit at sit bibendum vestibulum. Lorem pellentesque diam in neque. Nam nibh et ornare odio scelerisque. In id morbi integer orci. Donec condimentum tortor scelerisque diam. Facilisi sollicitudin elit velit, hendrerit enim. Eleifend in pharetra vel blandit pharetra vulputate odio vitae, mattis. Aliquam luctus dui convallis eget dolor sem urna enim. Odio viverra fermentum pellentesque blandit sollicitudin integer facilisis et velit. Pulvinar consectetur massa libero cras euismod. Viverra urna proin nibh nulla nibh a eu facilisis. Adipiscing nec nam tempus lacus et turpis nunc. Ornare sed risus vivamus arcu morbi diam. Eget maecenas felis ornare tincidunt urna diam purus sed. Posuere sit amet id hendrerit a. Egestas ut vitae arcu nibh est tortor sit. Ullamcorper tempus, nam habitasse pharetra. Eleifend euismod urna, sed pretium dignissim in vel faucibus bibendum. Ullamcorper non mollis ac scelerisque pharetra cras.',
            key: Key('statements'),
            type: FontType.smallText,
            padding: AppValues.screenHorizontalPadding,
            height: 1.6,
          ),
          _riskDisclosureAgreement
        ],
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget get _licenseeProfile => CustomSilverBox(
        key: const Key('licensee_profile'),
        title: '',
        content: Row(
          children: [
            const CustomText(
              '-Image-',
              padding: EdgeInsets.only(left: 12, right: 24),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CustomText(
                    'Licensee: Chau Kwong Lui',
                    type: FontType.smallTextBold,
                    padding: EdgeInsets.only(bottom: 8),
                  ),
                  CustomText(
                    'CE No.: AU456',
                    type: FontType.note,
                  ),
                ],
              ),
            )
          ],
        ),
        margin: AppValues.screenHorizontalPadding,
      );

  Widget get _riskDisclosureAgreement =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
          buildWhen: (previous, current) =>
              previous.isRiskDisclosureAgreementChecked !=
              current.isRiskDisclosureAgreementChecked,
          builder: (context, state) => CustomCheckbox(
                checkboxKey:
                    const Key('signing_risk_disclosure_agreement_value'),
                key: const Key('signing_risk_disclosure_agreement'),
                padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
                text:
                    'I have read, understood, and agree with the Risk Disclosure Statement',
                fontHeight: 1.4,
                isChecked: state.isRiskDisclosureAgreementChecked,
                fontType: FontType.smallText,
                onChanged: (value) => context
                    .read<SigningAgreementBloc>()
                    .add(RiskDisclosureAgreementChecked(value!)),
              ));

  Widget _bottomButton(BuildContext context) =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
          buildWhen: (previous, current) =>
              previous.isRiskDisclosureAgreementChecked !=
              current.isRiskDisclosureAgreementChecked,
          builder: (context, state) => KycButtonPair(
                primaryButtonOnClick: () => context
                    .read<NavigationBloc<KycPageStep>>()
                    .add(const PageChanged(KycPageStep.signTaxAgreements)),
                secondaryButtonOnClick: () => CarouselScreen.open(context),
                disablePrimaryButton: !state.isRiskDisclosureAgreementChecked,
                primaryButtonLabel: 'AGREE',
                secondaryButtonLabel: 'CONTINUE LATER',
              ));
}
