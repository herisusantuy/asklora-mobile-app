import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';

import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../payment/deposits/bloc/navigation_bloc/navigation_bloc.dart';
import '../../bloc/account_bloc.dart';
import '../../bloc/signing_broker_agreement/bloc/signing_broker_agreement_bloc.dart';
import '../widgets/signature_drawer.dart';
import 'widgets/upgrade_account_button.dart';

class SigningBrokerAgreementsForm extends StatelessWidget {
  SigningBrokerAgreementsForm({Key? key}) : super(key: key);

  final SignatureController _signatureController = SignatureController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _agreement(),
                _isUnderstoodAlpacaCustomAgreementChecked(),
                _isSigningAgreementChecked(),
                _customerSignature(),
              ],
            ),
          ),
        ),
        _nextButton(),
      ],
    );
  }

  Widget _agreement() =>
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        buildWhen: (previous, current) =>
            previous.isAlpacaCustomerAgreementOpened !=
            current.isAlpacaCustomerAgreementOpened,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextButton(
                        key: const Key('alpaca_customer_agreement_button'),
                        borderRadius: 30,
                        buttonText: 'Alpaca Customer Agreement',
                        onClick: () => context
                            .read<SigningBrokerAgreementBloc>()
                            .add(const AlpacaCustomerAgreementOpened(true)),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: CustomTextButton(
                        key: const Key('asklora_client_agreement_button'),
                        borderRadius: 30,
                        buttonText: 'Asklora Client Agreement',
                        onClick: () => context
                            .read<SigningBrokerAgreementBloc>()
                            .add(const AskLoraClientAgreementOpened()),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomText(
                  'You will not be able to check the boxes below until you have clicked the Alpaca Customer Agreement and the AskLORA Client Agreement',
                  type: FontType.bodyTextBold,
                )
              ],
            ),
          );
        },
      );

  Widget _isUnderstoodAlpacaCustomAgreementChecked() =>
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        buildWhen: (previous, current) =>
            previous.isAlpacaCustomerAgreementOpened !=
                current.isAlpacaCustomerAgreementOpened ||
            previous.isAskLoraClientAgreementOpened !=
                current.isAskLoraClientAgreementOpened ||
            previous.isUnderstoodAlpacaCustomAgreementChecked !=
                current.isUnderstoodAlpacaCustomAgreementChecked,
        builder: (context, state) {
          return CustomCheckbox(
            checkboxKey: const Key('signing_broker_agreement_checkbox_1_value'),
            key: const Key('signing_broker_agreement_checkbox_1'),
            padding: const EdgeInsets.only(top: 10),
            text:
                'I have read, understood, and agree to be bound by Alpaca Securities LLC and LORA Technologies, Limited account terms, and all other terms, disclosures and disclaimers applicable to me, as referenced in the Alpaca Customer Agreement. I also acknowledge that the Alpaca Customer Agreement contains a pre-dispute arbitration clause in Section 42.',
            disabled: !state.isAlpacaCustomerAgreementOpened ||
                !state.isAskLoraClientAgreementOpened,
            isChecked: state.isUnderstoodAlpacaCustomAgreementChecked,
            onChanged: (value) => context
                .read<SigningBrokerAgreementBloc>()
                .add(UnderstoodAlpacaCustomAgreementChecked(value!)),
          );
        },
      );

  Widget _isSigningAgreementChecked() =>
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        buildWhen: (previous, current) =>
            previous.isUnderstoodAlpacaCustomAgreementChecked !=
                current.isUnderstoodAlpacaCustomAgreementChecked ||
            previous.isSigningAgreementChecked !=
                current.isSigningAgreementChecked,
        builder: (context, state) {
          return CustomCheckbox(
            checkboxKey: const Key('signing_broker_agreement_checkbox_2_value'),
            key: const Key('signing_broker_agreement_checkbox_2'),
            padding: const EdgeInsets.only(top: 10),
            text:
                'I understand I am signing this agreement electronically, and that my electronic signature will have the same effect as physically signing and returning the Application Agreement.',
            disabled: !state.isAlpacaCustomerAgreementOpened,
            isChecked: state.isSigningAgreementChecked,
            onChanged: (value) => context
                .read<SigningBrokerAgreementBloc>()
                .add(SigningAgreementChecked(value!)),
          );
        },
      );

  Widget _customerSignature() =>
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText('Customer Signature: '),
                if (!state.isSignatureDrew)
                  SignatureDrawer(
                      key: const Key('customer_signature_drawer'),
                      signatureController: _signatureController,
                      onSubmit: () async {
                        context.read<SigningBrokerAgreementBloc>().add(
                            CustomerSignatureDrew(
                                await _getCustomerSignature(),
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
                          buttonText: 'Reset Signature',
                          onClick: () {
                            _signatureController.clear();
                            context
                                .read<SigningBrokerAgreementBloc>()
                                .add(const CustomerSignatureReset());
                          })
                    ],
                  ),
              ],
            ),
          );
        },
      );

  Widget _nextButton() =>
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        builder: (context, state) {
          return UpgradeAccountButton(
            key: const Key('signing_broker_agreement_next_step_button'),
            disable: state.disabledNextButton(),
            onClick: () => context
                .read<NavigationBloc<UpgradeAccountPageStep>>()
                .add(const PageChanged(UpgradeAccountPageStep.trustedContact)),
          );
        },
      );

  Future<String?> _getCustomerSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.transparent,
      points: _signatureController.points,
    );
    final bytes = await exportController.toPngBytes();
    String? base64Image;
    if (bytes != null) {
      base64Image = base64Encode(bytes);
    }
    return base64Image;
  }
}
