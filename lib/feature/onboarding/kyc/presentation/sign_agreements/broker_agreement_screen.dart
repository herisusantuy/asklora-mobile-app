import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/values/app_values.dart';
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

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Sign Agreements',
      content: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            const CustomText(
              'Please read the 2 agreements pdf files.',
              type: FontType.smallText,
              padding: AppValues.screenHorizontalPadding,
              height: 2,
            ),
            _agreementCard(
                key: const Key('alpaca_agreement'),
                title: 'Alpaca Customer Agreement.pdf',
                onTap: () => context
                    .read<SigningAgreementBloc>()
                    .add(const AlpacaCustomerAgreementOpened(true))),
            _agreementCard(
                key: const Key('asklora_agreement'),
                title: 'Asklora Client Agreement.pdf',
                onTap: () => context
                    .read<SigningAgreementBloc>()
                    .add(const AskLoraClientAgreementOpened())),
            _boundByAlpacaAndLoraAgreement,
            _understandOnTheAgreement,
            _certifyNotUSCitizenAgreement,
            _customerSignature
          ],
        ),
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget _agreementCard(
          {required String title,
          required VoidCallback onTap,
          required Key key}) =>
      GestureDetector(
        key: key,
        onTap: onTap,
        child: Container(
          margin: AppValues.screenHorizontalPadding.copyWith(top: 18),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey)),
          child: Row(
            children: [
              Icon(
                Icons.picture_as_pdf_outlined,
                color: Colors.grey[400]!,
              ),
              Expanded(
                  child: CustomText(
                title,
                type: FontType.smallTextBold,
                padding: const EdgeInsets.only(left: 14),
              ))
            ],
          ),
        ),
      );

  Widget get _boundByAlpacaAndLoraAgreement =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
          buildWhen: (previous, current) =>
              previous.isAlpacaCustomerAgreementOpened !=
                  current.isAlpacaCustomerAgreementOpened ||
              previous.isAskLoraClientAgreementOpened !=
                  current.isAskLoraClientAgreementOpened ||
              previous.isBoundByAlpacaAndLoraAgreementChecked !=
                  current.isBoundByAlpacaAndLoraAgreementChecked,
          builder: (context, state) => CustomCheckbox(
                checkboxKey:
                    const Key('bound_alpaca_lora_agreement_checkbox_value'),
                key: const Key('bound_alpaca_lora_agreement_checkbox'),
                padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
                text:
                    'I have read, understood, and agree to be bound by Alpaca Securities LLC and LORA Technologies, Limited account terms, and all other terms, disclosures and disclaimers applicable to me, as referenced in the Alpaca Customer Agreement. I also acknowledge that the Alpaca Customer Agreement contains a pre-dispute arbitration clause in Section 42.',
                disabled: !state.isAlpacaCustomerAgreementOpened ||
                    !state.isAskLoraClientAgreementOpened,
                isChecked: state.isBoundByAlpacaAndLoraAgreementChecked,
                fontType: FontType.smallText,
                fontHeight: 1.4,
                onChanged: (value) => context
                    .read<SigningAgreementBloc>()
                    .add(BoundByAlpacaAndLoraAgreementChecked(value!)),
              ));

  Widget get _understandOnTheAgreement =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
          buildWhen: (previous, current) =>
              previous.isBoundByAlpacaAndLoraAgreementChecked !=
                  current.isBoundByAlpacaAndLoraAgreementChecked ||
              previous.isUnderstandOnTheAgreementChecked !=
                  current.isUnderstandOnTheAgreementChecked,
          builder: (context, state) => CustomCheckbox(
                checkboxKey: const Key('understand_agreement_checkbox_value'),
                key: const Key('understand_agreement_checkbox'),
                padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
                text:
                    'I understand I am signing this agreement electronically, and that my electronic signature will have the same effect as physically signing and returning the Application Agreement.',
                fontHeight: 1.4,
                disabled: !state.isBoundByAlpacaAndLoraAgreementChecked,
                isChecked: state.isUnderstandOnTheAgreementChecked,
                fontType: FontType.smallText,
                onChanged: (value) => context
                    .read<SigningAgreementBloc>()
                    .add(UnderstandOnTheAgreementChecked(value!)),
              ));

  Widget get _certifyNotUSCitizenAgreement =>
      BlocBuilder<SigningAgreementBloc, SigningAgreementState>(
          buildWhen: (previous, current) =>
              previous.isUnderstandOnTheAgreementChecked !=
                  current.isUnderstandOnTheAgreementChecked ||
              previous.isCertifyNotUSCitizenAgreementChecked !=
                  current.isCertifyNotUSCitizenAgreementChecked,
          builder: (context, state) => CustomCheckbox(
                checkboxKey: const Key('certify_not_us_citizen_checkbox_value'),
                key: const Key('certify_not_us_citizen_checkbox'),
                padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
                text:
                    'I certify that I am not a US citizen, US resident alien or other US person for US tax purposes, and I am submitting the applicable Form W-8 BEN with this form to certify my foreign status and, if applicable, claim tax treaty benefits.',
                fontHeight: 1.4,
                disabled: !state.isUnderstandOnTheAgreementChecked,
                isChecked: state.isCertifyNotUSCitizenAgreementChecked,
                fontType: FontType.smallText,
                onChanged: (value) => context
                    .read<SigningAgreementBloc>()
                    .add(CertifyNotUSCitizenAgreementChecked(value!)),
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
