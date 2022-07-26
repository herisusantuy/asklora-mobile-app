import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../bloc/withdrawal_bloc.dart';
import '../../presentation/custom_withdrawal_widget.dart';
import '../../presentation/withdrawal_next_button.dart';

class WithdrawalBankDetailScreen extends StatelessWidget {
  const WithdrawalBankDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWithdrawalWidget(
      backTo: WithdrawalPages.welcome,
      navigationButton: const WithdrawalNextButton(
          key: Key('withdrawal_bank_detail_screen_next_button'),
          nextTo: WithdrawalPages.amount,
          disable: false),
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
        _customContainer('Account No.', '1234567890'),
        _customContainer('Bank Name',
            'THE HONG KONG AND SHANGHAI BANKING CORPORATION LIMITED'),
        _customContainer('Bank No.', '813'),
        _customContainer('Account Name', 'LEUNG CHIU WAI')
      ],
    );
  }

  Widget _customContainer(String title, String label) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title,
              type: FontType.smallTextBold,
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: CustomText(
                  label,
                  type: FontType.bodyText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      );
}
