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
        backTo: DepositPages.depositMethod,
        navigationButton: const DepositNextButton(
          key: Key('deposit_wire_transfer_next_button'),
          nextTo: DepositPages.depositMethod,
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
          _accountNumberCard(),
          _bankNameCard(),
          _bankNumberCard(),
          _accountNameCard(),
          _cautionText(),
          _swiftCodeCard(),
          _bankAddressCard(),
        ]);
  }

  Widget _accountNumberCard() {
    return const CustomCardCopyText(
      key: Key('deposit_account_number_card'),
      label: 'Account No.',
      text: '1234567890',
      message: 'Account No Copied',
      padding: EdgeInsets.only(bottom: 20),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }

  Widget _bankNameCard() {
    return const CustomCardCopyText(
      key: Key('deposit_bank_name_card'),
      label: 'Bank Name.',
      text: 'DBS Bank (Hong Kong) Limited',
      message: 'Bank Name Copied',
      padding: EdgeInsets.only(bottom: 20),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }

  Widget _bankNumberCard() {
    return const CustomCardCopyText(
      key: Key('deposit_bank_number_card'),
      label: 'Bank No.',
      text: '016',
      message: 'Bank Number Copied',
      padding: EdgeInsets.only(bottom: 20),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }

  Widget _accountNameCard() {
    return const CustomCardCopyText(
      key: Key('deposit_account_name_card'),
      label: 'Account Name.',
      text: 'LORA Advisors Limited',
      message: 'Account Name Copied',
      padding: EdgeInsets.only(bottom: 10),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }

  Widget _cautionText() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
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

  Widget _swiftCodeCard() {
    return const CustomCardCopyText(
      key: Key('deposit_swift_code_card'),
      label: 'Swift Code.',
      text: 'DHBKHKHH',
      message: 'Swift Code Copied',
      padding: EdgeInsets.only(bottom: 20),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }

  Widget _bankAddressCard() {
    return const CustomCardCopyText(
      key: Key('deposit_bank_address_card'),
      label: 'Bank Address.',
      text: 'G/F, The Center, 99 Queen`s Road Central, Central, Hong Kong',
      message: 'Bank Address Copied',
      textAlign: TextAlign.start,
      padding: EdgeInsets.only(bottom: 20),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    );
  }
}
