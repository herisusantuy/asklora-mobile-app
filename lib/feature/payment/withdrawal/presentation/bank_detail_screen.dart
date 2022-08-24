import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../bloc/bank_account_bloc.dart';
import '../../domain/get_bank_account_response.dart';
import '../../presentation/custom_payment_text_information_widget.dart';
import '../bloc/withdrawal_bloc.dart';
import 'widget/custom_withdrawal_widget.dart';
import 'widget/withdrawal_next_button.dart';

class BankDetailScreen extends StatelessWidget {
  const BankDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetBankAccountResponse? fps = context
        .read<BankAccountBloc>()
        .state
        .response
        .data
        ?.fpsBankAccounts?[0];
    return CustomWithdrawalWidget(
      title: 'Your Bank Details',
      navigationButton: const WithdrawalNextButton(
          key: Key('withdrawal_bank_detail_screen_next_button'),
          nextTo: WithdrawalPagesStep.amount,
          disable: false),
      child: ListView(
        children: [
          const CustomText(
            'Please confirm your bank details. Your withdrawal will be credited to this account',
            type: FontType.smallTextBold,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            'If your bank details are different from below, please contact our customer support for further assistance',
            type: FontType.smallTextBold,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomPaymentTextInformationWidget(
              title: 'Account No.', label: fps?.accountNumber ?? ''),
          CustomPaymentTextInformationWidget(
              title: 'Bank Name', label: fps?.name ?? ''),
          CustomPaymentTextInformationWidget(
              title: 'Bank No.', label: fps?.bankCode ?? ''),
          CustomPaymentTextInformationWidget(
              title: 'Account Name', label: fps?.accountName ?? '')
        ],
      ),
    );
  }
}
