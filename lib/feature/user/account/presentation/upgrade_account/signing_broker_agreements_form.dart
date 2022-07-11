import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../../../../../core/presentation/custom_checkbox.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';

class SigningBrokerAgreementsForm extends StatelessWidget {
  final PageController controller;
  SigningBrokerAgreementsForm({
    Key? key,
    required this.controller,
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
        _nextButton()
      ],
    );
  }

  Widget _alpacaCustomerAgreement() => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CustomTextButton(
          borderRadius: 30,
          buttonText: 'Alpaca Customer Agreement',
          onClick: () {},
        ),
      );

  Widget _isUnderstoodAlpacaCustomAgreementChecked() => CustomCheckbox(
        padding: const EdgeInsets.only(top: 10),
        text:
            'I have read, understood, and agree to be bound by Alpaca Securities LLC and LORA Technologies, Limited account terms, and all other terms, disclosures and disclaimers applicable to me, as referenced in the Alpaca Customer Agreement. I also acknowledge that the Alpaca Customer Agreement contains a pre-dispute arbitration clause in Section 42.',
        isChecked: true,
        onChanged: (value) => value,
      );
  Widget _isSigningAgreementChecked() => CustomCheckbox(
        padding: const EdgeInsets.only(top: 10),
        text:
            'I understand I am signing this agreement electronically, and that my electronic signature will have the same effect as physically signing and returning the Application Agreement.',
        isChecked: true,
        onChanged: (value) => value,
      );

  Widget _customerSignature() => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText('Customer Signature: '),
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
                    child:
                        CustomTextButton(buttonText: 'Accept', onClick: () {})),
                Expanded(
                    child:
                        CustomTextButton(buttonText: 'Reset', onClick: () {})),
              ],
            )
          ],
        ),
      );
  Widget _nextButton() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextButton(
          borderRadius: 30,
          buttonText: 'Next',
          onClick: () {},
        ),
      );
}
