import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../presentation/custom_payment_button_button.dart';
import '../../../presentation/custom_payment_text_information_widget.dart';
import '../../../presentation/custom_payment_text_input.dart';
import '../../../presentation/payment_confirmation_dialog.dart';
import '../../../utils/amount_error_type.dart';
import '../../bloc/deposit_bloc.dart';
import '../../bloc/navigation_bloc/navigation_bloc.dart';
import '../../shareable/widget/custom_deposit_widget.dart';
import '../bloc/amount/amount_bloc.dart';

class EddaAmountDepositScreen extends StatelessWidget {
  const EddaAmountDepositScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
        title: 'eDDA Deposit',
        navigationButton: BlocBuilder<AmountBloc, AmountState>(
            builder: (context, state) => CustomPaymentButton(
                  key: const Key('deposit_bank_amount_continue_button'),
                  disable:
                      state.depositAmountErrorType != AmountErrorType.unknown,
                  title: 'Continue',
                  onSubmit: () => _showConfirmationAmount(
                      context, state.depositHKDAmount.toString()),
                )),
        child: ListView(
          children: [
            _text(
                'Please note there is a minimum deposit amount of HKD10,000 for users who are depositing with a new bank account'),
            const CustomPaymentTextInformationWidget(
              key: Key('deposit_amount_bank_details'),
              title: 'Bank Details',
              label:
                  'THE HONG KONG AND SHANGHAI BANKING CORPORATION LIMITED (004)..',
              paddingBottom: 30,
            ),
            CustomPaymentTextInput(
                key: const Key('deposit_edda_amount_input'),
                titleText: 'Deposit Amount',
                textInputType: TextInputType.number,
                textInputFormatterList: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                prefixText: 'HKD',
                hintText: 'Enter Amount',
                onChanged: (value) => context.read<AmountBloc>().add(
                    AmountChanged(value.isNotEmpty ? double.parse(value) : 0))),
          ],
        ));
  }

  Widget _text(String text,
          {FontType fontType = FontType.smallText,
          double bottomPadding = 30}) =>
      CustomText(
        text,
        padding: EdgeInsets.only(top: 10, bottom: bottomPadding),
        type: fontType,
      );

  void _showConfirmationAmount(
          BuildContext context, String amount) =>
      showModalBottomSheet(
          context: context,
          builder: (_) => PaymentConfirmationDialog(
              title: 'Deposit Amount (HKD)',
              amount: amount,
              bankAccountName: "Payer's",
              bankName:
                  '004 The Hong Kong and Shanghai Banking Corporation Limited (7890)',
              warningText:
                  'Please note that the deposit amount cannot exceed the account balance in your bank. Otherwise, your bank may charge you extra fees due to transaction failures',
              onSubmit: () => context
                  .read<NavigationBloc<DepositPageStep>>()
                  .add(const PageChanged(DepositPageStep.acknowledged))));
}
