import 'package:flutter/material.dart';

import '../../../core/presentation/custom_text.dart';
import '../bloc/deposit_bloc.dart';
import 'widget/custom_card_copy_text.dart';
import 'widget/custom_deposit_widget.dart';
import 'widget/deposit_next_button.dart';

class WireTransferScreen extends StatelessWidget {
  const WireTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
        backTo: DepositPageStep.depositMethod,
        navigationButton: const DepositNextButton(
          key: Key('deposit_wire_transfer_next_button'),
          label: 'Upload Proof Of Remittance',
          nextTo: DepositPageStep.uploadProof,
          disable: false,
        ),
        children: [
          const CustomText('Wire Transfer',
              padding: EdgeInsets.only(bottom: 30), type: FontType.h2),
          const CustomText(
            'Please transfer to AskLORA’s bank account using your bank app',
            padding: EdgeInsets.only(bottom: 10),
          ),
          const CustomText(
            'Please note there is a minimum deposit amount of HKD10,000 for users who are depositing with a new bank account',
            padding: EdgeInsets.only(bottom: 30),
          ),
          _cardCopyText('Account No.', '1234567890', 'Account Copied',
              key: 'deposit_account_number_card'),
          _cardCopyText(
              'Bank Name', 'DBS Bank (Hong Kong) Limited', 'Bank Name Copied',
              key: 'deposit_bank_name_card'),
          _cardCopyText('Bank No.', '016', 'Bank No. Copied',
              key: 'deposit_bank_number_card'),
          _cardCopyText(
              'Account Name.', 'LORA Advisors Limited', 'Account Name Copied',
              key: 'deposit_account_name_card'),
          _infoText(),
          _cardCopyText('Swift Code.', 'DHBKHKHH', 'Swift Code Copied',
              key: 'deposit_swift_code_card'),
          _cardCopyText(
            'Bank Address',
            'G/F, The Center, 99 Queen`s Road Central, Central, Hong Kong',
            'Bank Address Copied',
            key: 'deposit_bank_address_card',
            textAlign: TextAlign.start,
          ),
        ]);
  }

  Widget _cardCopyText(
    String label,
    String text,
    String message, {
    String? key,
    TextAlign textAlign = TextAlign.center,
  }) {
    return CustomCardCopyText(
      key: Key(key ?? ''),
      label: label,
      text: text,
      message: message,
      textAlign: textAlign,
      padding: const EdgeInsets.only(bottom: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    );
  }

  Widget _infoText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.info_outline_rounded,
            size: 20,
          ),
          Expanded(
              child: CustomText(
            'Please make sure that you input the name as shown exactly above. Failure to do so may result in your transfer being returned by your bank.',
            padding: EdgeInsets.only(left: 5),
            type: FontType.smallNote,
          ))
        ],
      ),
    );
  }
}
