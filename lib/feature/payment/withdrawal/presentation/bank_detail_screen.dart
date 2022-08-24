import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_information.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../domain/get_bank_account_response.dart';
import '../bloc/withdrawal_bloc.dart';
import 'widget/withdrawal_next_button.dart';

class BankDetailScreen extends StatelessWidget {
  final GetBankAccountResponse? fpsAccount;

  const BankDetailScreen({required this.fpsAccount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<WithdrawalPagesStep>(
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
          CustomTextInformation(
              title: 'Account No.', label: fpsAccount?.accountNumber ?? ''),
          CustomTextInformation(
              title: 'Bank Name', label: fpsAccount?.name ?? ''),
          CustomTextInformation(
              title: 'Bank No.', label: fpsAccount?.bankCode ?? ''),
          CustomTextInformation(
              title: 'Account Name', label: fpsAccount?.accountName ?? '')
        ],
      ),
    );
  }
}
