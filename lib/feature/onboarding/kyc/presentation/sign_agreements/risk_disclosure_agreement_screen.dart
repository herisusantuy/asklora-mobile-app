import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/round_colored_box.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../../tabs/tabs_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../../bloc/signing_agreement/signing_agreement_bloc.dart';
import '../widgets/kyc_base_form.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
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
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _licenseeProfile,
          const SizedBox(
            height: 42,
          ),
          const KycSubTitle(
            key: Key('sub_title'),
            subTitle: 'Risk Disclosure Statement',
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextNew(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a, elementum enim a elit at sit bibendum vestibulum. Lorem pellentesque diam in neque. Nam nibh et ornare odio scelerisque. In id morbi integer orci. Donec condimentum tortor scelerisque diam. Facilisi sollicitudin elit velit, hendrerit enim. Eleifend in pharetra vel blandit pharetra vulputate odio vitae, mattis. Aliquam luctus dui convallis eget dolor sem urna enim. Odio viverra fermentum pellentesque blandit sollicitudin integer facilisis et velit. Pulvinar consectetur massa libero cras euismod. Viverra urna proin nibh nulla nibh a eu facilisis. Adipiscing nec nam tempus lacus et turpis nunc. Ornare sed risus vivamus arcu morbi diam. Eget maecenas felis ornare tincidunt urna diam purus sed. Posuere sit amet id hendrerit a. Egestas ut vitae arcu nibh est tortor sit. Ullamcorper tempus, nam habitasse pharetra. Eleifend euismod urna, sed pretium dignissim in vel faucibus bibendum. Ullamcorper non mollis ac scelerisque pharetra cras.',
            key: const Key('statements'),
            style:
                AskLoraTextStyles.body1.copyWith(color: AskLoraColors.charcoal),
          ),
          const SizedBox(
            height: 46,
          ),
          _riskDisclosureAgreement,
          const SizedBox(
            height: 14,
          ),
        ],
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget get _licenseeProfile => RoundColoredBox(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        key: const Key('licensee_profile'),
        content: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 24),
              child: getPngImage('joseph_chang', height: 60, width: 60),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Licensee: Joseph Chang',
                    type: FontType.smallTextBold,
                    padding: EdgeInsets.only(bottom: 8),
                  ),
                  CustomText(
                    'CE No.: XXXXXX',
                    type: FontType.note,
                  ),
                ],
              ),
            )
          ],
        ),
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
          builder: (context, state) => ButtonPair(
                primaryButtonOnClick: () => context
                    .read<NavigationBloc<KycPageStep>>()
                    .add(const PageChanged(KycPageStep.signTaxAgreements)),
                secondaryButtonOnClick: () =>
                    TabsScreen.openAndRemoveAllRoute(context),
                disablePrimaryButton: !state.isRiskDisclosureAgreementChecked,
                primaryButtonLabel: 'AGREE',
                secondaryButtonLabel: 'CONTINUE LATER',
              ));
}
