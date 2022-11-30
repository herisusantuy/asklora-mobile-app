import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';
import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../../bloc/signing_broker_agreement/signing_broker_agreement_bloc.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';
import 'widgets/signature_drawer.dart';

class SignAgreementsScreen extends StatelessWidget {
  final double progress;
  final SignatureController _signatureController = SignatureController();

  SignAgreementsScreen({required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Set Up Financial Profile',
      content: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          const CustomText(
            'Please read the 2 agreements pdf files.',
            type: FontType.smallText,
            padding: AppValues.screenHorizontalPadding,
            height: 2,
          ),
          _agreementCard(
              title: 'Alpaca Customer Agreement.pdf',
              onTap: () => context
                  .read<SigningBrokerAgreementBloc>()
                  .add(const AlpacaCustomerAgreementOpened(true))),
          _agreementCard(
              title: 'Asklora Client Agreement.pdf',
              onTap: () => context
                  .read<SigningBrokerAgreementBloc>()
                  .add(const AskLoraClientAgreementOpened())),
          _boundByAlpacaAndLoraAgreement,
          _understandOnTheAgreement,
          _certifyNotUSCitizenAgreement,
          _customerSignature
        ],
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget _agreementCard({required String title, required VoidCallback onTap}) =>
      GestureDetector(
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
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
          buildWhen: (previous, current) =>
              previous.isAlpacaCustomerAgreementOpened !=
                  current.isAlpacaCustomerAgreementOpened ||
              previous.isAskLoraClientAgreementOpened !=
                  current.isAskLoraClientAgreementOpened ||
              previous.isBoundByAlpacaAndLoraAgreementChecked !=
                  current.isBoundByAlpacaAndLoraAgreementChecked,
          builder: (context, state) => CustomCheckbox(
                checkboxKey:
                    const Key('signing_broker_agreement_checkbox_1_value'),
                key: const Key('signing_broker_agreement_checkbox_1'),
                padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
                text:
                    'I have read, understood, and agree to be bound by Alpaca Securities LLC and LORA Technologies, Limited account terms, and all other terms, disclosures and disclaimers applicable to me, as referenced in the Alpaca Customer Agreement. I also acknowledge that the Alpaca Customer Agreement contains a pre-dispute arbitration clause in Section 42.',
                disabled: !state.isAlpacaCustomerAgreementOpened ||
                    !state.isAskLoraClientAgreementOpened,
                isChecked: state.isBoundByAlpacaAndLoraAgreementChecked,
                fontType: FontType.smallText,
                fontHeight: 1.4,
                onChanged: (value) => context
                    .read<SigningBrokerAgreementBloc>()
                    .add(BoundByAlpacaAndLoraAgreementChecked(value!)),
              ));

  Widget get _understandOnTheAgreement =>
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
          buildWhen: (previous, current) =>
              previous.isBoundByAlpacaAndLoraAgreementChecked !=
                  current.isBoundByAlpacaAndLoraAgreementChecked ||
              previous.isUnderstandOnTheAgreementChecked !=
                  current.isUnderstandOnTheAgreementChecked,
          builder: (context, state) => CustomCheckbox(
                checkboxKey:
                    const Key('signing_broker_agreement_checkbox_2_value'),
                key: const Key('signing_broker_agreement_checkbox_2'),
                padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
                text:
                    'I understand I am signing this agreement electronically, and that my electronic signature will have the same effect as physically signing and returning the Application Agreement.',
                fontHeight: 1.4,
                disabled: !state.isBoundByAlpacaAndLoraAgreementChecked,
                isChecked: state.isUnderstandOnTheAgreementChecked,
                fontType: FontType.smallText,
                onChanged: (value) => context
                    .read<SigningBrokerAgreementBloc>()
                    .add(UnderstandOnTheAgreementChecked(value!)),
              ));

  Widget get _certifyNotUSCitizenAgreement =>
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
          buildWhen: (previous, current) =>
              previous.isUnderstandOnTheAgreementChecked !=
                  current.isUnderstandOnTheAgreementChecked ||
              previous.isCertifyNotUSCitizenAgreementChecked !=
                  current.isCertifyNotUSCitizenAgreementChecked,
          builder: (context, state) => CustomCheckbox(
                checkboxKey:
                    const Key('signing_broker_agreement_checkbox_3_value'),
                key: const Key('signing_broker_agreement_checkbox_3'),
                padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
                text:
                    'I certify that I am not a US citizen, US resident alien or other US person for US tax purposes, and I am submitting the applicable Form W-8 BEN with this form to certify my foreign status and, if applicable, claim tax treaty benefits.',
                fontHeight: 1.4,
                disabled: !state.isUnderstandOnTheAgreementChecked,
                isChecked: state.isCertifyNotUSCitizenAgreementChecked,
                fontType: FontType.smallText,
                onChanged: (value) => context
                    .read<SigningBrokerAgreementBloc>()
                    .add(CertifyNotUSCitizenAgreementChecked(value!)),
              ));

  Widget get _customerSignature =>
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!state.isSignatureDrew)
                  SignatureDrawer(
                      key: const Key('customer_signature_drawer'),
                      onSubmit: () async {
                        context.read<SigningBrokerAgreementBloc>().add(
                            CustomerSignatureDrew(
                                '',
                                DateFormat('yyyy-MM-ddThh:mm')
                                    .format(DateTime.now())));
                      },
                      onReset: () => _signatureController.clear())
                else
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(
                            base64Decode(state.customerSignature),
                            key: const Key('customer_signature_png'),
                            height: 200),
                      ),
                      CustomTextButton(
                          key: const Key('clear_signature_button'),
                          onTap: () {
                            _signatureController.clear();
                            context
                                .read<SigningBrokerAgreementBloc>()
                                .add(const CustomerSignatureReset());
                          }, label:  'Reset Signature',)
                    ],
                  ),
              ],
            ),
          );
        },
      );

  Widget _bottomButton(BuildContext context) =>
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
          buildWhen: (previous, current) =>
              previous.disabledNextButton() != current.disabledNextButton(),
          builder: (context, state) => KycButtonPair(
                primaryButtonOnClick: () => context
                    .read<NavigationBloc<KycPageStep>>()
                    .add(const PageChanged(KycPageStep.verifyIdentity)),
                secondaryButtonOnClick: () => CarouselScreen.open(context),
                disablePrimaryButton: state.disabledNextButton(),
                primaryButtonLabel: 'AGREE',
                secondaryButtonLabel: 'CONTINUE LATER',
              ));


}
