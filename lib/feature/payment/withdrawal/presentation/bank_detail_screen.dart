import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../presentation/custom_payment_text_information_widget.dart';
import '../bloc/withdrawal_bloc.dart';
import 'widget/custom_withdrawal_widget.dart';
import 'widget/withdrawal_next_button.dart';

class BankDetailScreen extends StatelessWidget {
  const BankDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomWithdrawalWidget(
      title: 'Your Bank Details',
      backTo: WithdrawalPages.welcome,
      navigationButton: WithdrawalNextButton(
          key: Key('withdrawal_bank_detail_screen_next_button'),
          nextTo: WithdrawalPages.amount,
          disable: false),
      children: [
        CustomText(
          'Please confirm your bank details. Your withdrawal will be credited to this account',
          type: FontType.smallTextBold,
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: 20,
        ),
        CustomText(
          'If your bank details are different from below, please contact our customer support for further assistance',
          type: FontType.smallTextBold,
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: 20,
        ),
        CustomPaymentTextInformationWidget(
            title: 'Account No.', label: '1234567890'),
        CustomPaymentTextInformationWidget(
            title: 'Bank Name',
            label: 'THE HONG KONG AND SHANGHAI BANKING CORPORATION LIMITED'),
        CustomPaymentTextInformationWidget(title: 'Bank No.', label: '813'),
        CustomPaymentTextInformationWidget(
            title: 'Account Name', label: 'LEUNG CHIU WAI')
      ],
    );
  }
}
