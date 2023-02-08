import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/buttons/secondary/view_file_button.dart';
import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../../bloc/signing_agreement/signing_agreement_bloc.dart';
import '../widgets/kyc_base_form.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import 'widgets/signature_drawer.dart';

class BrokerAgreementScreen extends StatelessWidget {
  final double progress;

  const BrokerAgreementScreen({required this.progress, Key? key})
      : super(key: key);

  static const double _spaceHeightDouble = 20;
  final SizedBox _spaceHeight = const SizedBox(height: _spaceHeightDouble);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Sign Agreements',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextNew(
            'Please read the the Asklora Customer Agreement. You must check all the boxes and provide your signature in order to proceed.',
            style:
                AskLoraTextStyles.body1.copyWith(color: AskLoraColors.charcoal),
          ),
          const SizedBox(
            height: 24,
          ),
          ViewFileButton(
              key: const Key('asklora_agreement'),
              label: 'Asklora Client Agreement.pdf',
              onTap: () => context
                  .read<SigningAgreementBloc>()
                  .add(const AskLoraClientAgreementOpened())),
          const SizedBox(
            height: 36,
          ),
          _boundByAskloraLoraAgreement,
          _spaceHeight,
          _understandOnTheAgreement,
          const SizedBox(
            height: 45,
          ),
          _customerSignature
        ],
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget get _boundByAskloraLoraAgreement =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
          buildWhen: (previous, current) =>
              previous.isAskLoraClientAgreementOpened !=
                  current.isAskLoraClientAgreementOpened ||
              previous.isBoundByAskloraAgreementChecked !=
                  current.isBoundByAskloraAgreementChecked,
          builder: (context, state) => CustomCheckbox(
                checkboxKey:
                    const Key('bound_alpaca_lora_agreement_checkbox_value'),
                key: const Key('bound_alpaca_lora_agreement_checkbox'),
                text:
                    'I have read, understood, and agree to be bound by LORA Advisors Limited’s account terms, and all other terms, disclosures and disclaimers applicable to me.',
                disabled: !state.isAskLoraClientAgreementOpened,
                isChecked: state.isBoundByAskloraAgreementChecked,
                fontType: FontType.smallText,
                fontHeight: 1.4,
                onChanged: (value) => context
                    .read<SigningAgreementBloc>()
                    .add(BoundByAskloraAgreementChecked(value!)),
              ));

  Widget get _understandOnTheAgreement =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
          buildWhen: (previous, current) =>
              previous.isBoundByAskloraAgreementChecked !=
                  current.isBoundByAskloraAgreementChecked ||
              previous.isUnderstandOnTheAgreementChecked !=
                  current.isUnderstandOnTheAgreementChecked,
          builder: (context, state) => CustomCheckbox(
                checkboxKey: const Key('understand_agreement_checkbox_value'),
                key: const Key('understand_agreement_checkbox'),
                text:
                    'I understand I am signing this agreement electronically, and that my electronic signature will have the same effect as physically signing and returning the Application Agreement.',
                fontHeight: 1.4,
                disabled: !state.isBoundByAskloraAgreementChecked,
                isChecked: state.isUnderstandOnTheAgreementChecked,
                fontType: FontType.smallText,
                onChanged: (value) => context
                    .read<SigningAgreementBloc>()
                    .add(UnderstandOnTheAgreementChecked(value!)),
              ));

  Widget get _customerSignature =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
        buildWhen: (previous, current) =>
            previous.customerSignature != current.customerSignature,
        builder: (context, state) => SignatureDrawer(
          key: const Key('customer_signature_drawer'),
          initialValue: state.customerSignature,
          onSubmit: () => context
              .read<SigningAgreementBloc>()
              .add(const CustomerSignatureDrew()),
          onReset: () => context
              .read<SigningAgreementBloc>()
              .add(const CustomerSignatureReset()),
          signatureController: state.signatureController,
        ),
      );

  Widget _bottomButton(BuildContext context) =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
          buildWhen: (previous, current) =>
              previous.disabledBrokerButton() != current.disabledBrokerButton(),
          builder: (context, state) => ButtonPair(
                primaryButtonOnClick: () => context
                    .read<NavigationBloc<KycPageStep>>()
                    .add(const PageChanged(
                        KycPageStep.signRiskDisclosureAgreements)),
                secondaryButtonOnClick: () => CarouselScreen.open(context),
                disablePrimaryButton: state.disabledBrokerButton(),
                primaryButtonLabel: 'AGREE',
                secondaryButtonLabel: 'CONTINUE LATER',
              ));
}
