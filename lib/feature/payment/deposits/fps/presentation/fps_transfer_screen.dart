import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../bloc/bank_account_bloc.dart';
import '../../bloc/deposit_bloc.dart';
import '../../shareable/widget/custom_card_copy_text.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../shareable/widget/custom_row_text.dart';
import '../../shareable/widget/deposit_next_button.dart';

class FpsTransferScreen extends StatelessWidget {
  final BankAccountState bankAccountState;
  final DepositState depositState;

  const FpsTransferScreen(
      {required this.bankAccountState, required this.depositState, Key? key})
      : super(key: key);

  final String fpsId = '123456789';

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<DepositPageStep>(
      title: 'FPS Transfer',
      child: ListView(
        children: [
          const CustomText(
            'Please transfer to AskLORA’s bank account using your bank app',
          ),
          const CustomText(
            'Please note there is a minimum deposit amount of HKD10,000 for users who are depositing with a new bank account',
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          CustomCardCopyText(
            key: const Key('fps_id_card'),
            keyCopyButton: const Key('fps_id_card_copy_button'),
            label: 'AskLORA’s FPS ID',
            text: fpsId,
            message: '$fpsId Copied',
            padding: const EdgeInsets.symmetric(vertical: 10),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          ),
          _notesText(),
          DepositNextButton(
            label: 'Continue',
            nextTo: _nextTo(context),
            disable: false,
          ),
        ],
      ),
    );
  }

  Widget _notesText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText('Notes:', padding: EdgeInsets.only(bottom: 5)),
        CustomRowText(
            padding: EdgeInsets.only(bottom: 5),
            index: '1',
            text:
                'Please make sure that the name under your FPS account matches with the name that you used to sign up'),
        CustomRowText(
            padding: EdgeInsets.only(bottom: 5),
            index: '2',
            text:
                'Please make sure your FPS number matches the phone number you used to register on AskLORA'),
        CustomRowText(
            padding: EdgeInsets.only(bottom: 20),
            index: '3',
            text:
                'Did you know that in a year, cows kill more people than sharks?'),
      ],
    );
  }

  DepositPageStep _nextTo(BuildContext context) {
    if (bankAccountState.response.data != null &&
        bankAccountState.response.data!.wireBankAccounts.isNotEmpty &&
        depositState.useExistingBankAccount) {
      return DepositPageStep.acknowledged;
    } else {
      return DepositPageStep.uploadProof;
    }
  }
}
