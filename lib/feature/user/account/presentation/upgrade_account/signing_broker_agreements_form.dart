import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:signature/signature.dart';

import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../bloc/signing_broker_agremeent/bloc/signing_broker_agreement_bloc.dart';

class SigningBrokerAgreementsForm extends StatelessWidget {
  final PageController controller;
  // final SignatureController signatureController;
  SigningBrokerAgreementsForm({
    Key? key,
    required this.controller,
    // required this.signatureController,
  }) : super(key: key);

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
                _alpacaCustomerAgreement(),
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

  Widget _alpacaCustomerAgreement() =>
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        buildWhen: (previous, current) =>
            previous.isAlpacaCustomerAgreementOpened !=
            current.isAlpacaCustomerAgreementOpened,
        builder: (context, state) {
          print(
              'alpaca customer agreement opened : ${state.isAlpacaCustomerAgreementOpened}');
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CustomTextButton(
              borderRadius: 30,
              buttonText: 'Alpaca Customer Agreement',
              onClick: () => context
                  .read<SigningBrokerAgreementBloc>()
                  .add(const AlpacaCustomerAgreementOpened(true)),
            ),
          );
        },
      );

  Widget _isUnderstoodAlpacaCustomAgreementChecked() =>
      BlocBuilder<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        buildWhen: (previous, current) =>
            previous.isAlpacaCustomerAgreementOpened !=
                current.isAlpacaCustomerAgreementOpened ||
            previous.isUnderstoodAlpacaCustomAgreementChecked !=
                current.isUnderstoodAlpacaCustomAgreementChecked,
        builder: (context, state) {
          print(
              'understood : ${state.isUnderstoodAlpacaCustomAgreementChecked}');
          return CustomCheckbox(
            padding: const EdgeInsets.only(top: 10),
            text:
                'I have read, understood, and agree to be bound by Alpaca Securities LLC and LORA Technologies, Limited account terms, and all other terms, disclosures and disclaimers applicable to me, as referenced in the Alpaca Customer Agreement. I also acknowledge that the Alpaca Customer Agreement contains a pre-dispute arbitration clause in Section 42.',
            disabled: !state.isAlpacaCustomerAgreementOpened,
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
          print('understand : ${state.isSigningAgreementChecked}');
          return CustomCheckbox(
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
          print('rebuild customer signature');
          print('state signature : ${state.customerSignature}');
          return Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText('Customer Signature: '),
                if (state.customerSignature == null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Signature(
                          controller: _signatureController,
                          height: 200,
                          backgroundColor: Colors.grey[300]!,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomTextButton(
                                  buttonText: 'Accept',
                                  onClick: () => context
                                      .read<SigningBrokerAgreementBloc>()
                                      .add(CustomerSignatureDrew(
                                          _signatureController)))),
                          Expanded(
                              child: CustomTextButton(
                                  buttonText: 'Reset',
                                  onClick: () => _signatureController.clear())),
                        ],
                      )
                    ],
                  )
                else
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(
                          state.customerSignature!,
                          height: 200,
                        ),
                      ),
                      CustomTextButton(
                          buttonText: 'Reset Signature',
                          onClick: () {
                            print('reset');
                            context.read<SigningBrokerAgreementBloc>().add(
                                CustomerSignatureReset(_signatureController));
                            //_signatureController.clear();
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
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: CustomTextButton(
              borderRadius: 30,
              buttonText: 'Next',
              disable: state.disabledNextButton(),
              onClick: () {},
            ),
          );
        },
      );
}
