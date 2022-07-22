import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../custom_payment_text_input.dart';
import '../../bloc/withdraw_bloc.dart';
import '../../custom_scaffold_body.dart';

class WithdrawalBankDetailScreen extends StatelessWidget {
  static const String route = '/withdraw_bank_detail';

  const WithdrawalBankDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldBody(
      onTapBack: WithdrawPages.welcome,
      children: [
        const CustomText('Your Bank Details', type: FontType.h1),
        const SizedBox(
          height: 50,
        ),
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
        CustomPaymentTextInput(
            labelText: 'Account No.',
            hintText: 'Account No.',
            onChanged: (_) {}),
        CustomPaymentTextInput(
            labelText: 'Bank Name',
            hintText: 'THE HONG KONG AND SHANGHAI BANKING CORPORATION LIMITED',
            onChanged: (_) {}),
        CustomPaymentTextInput(
            labelText: 'Bank No.', hintText: 'Bank No.', onChanged: (_) {}),
        CustomPaymentTextInput(
            labelText: 'Account Name',
            hintText: 'Account Name',
            onChanged: (_) {}),
      ],
    );
  }
}
