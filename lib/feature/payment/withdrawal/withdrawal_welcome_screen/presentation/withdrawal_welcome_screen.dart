import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../bloc/withdrawal_bloc.dart';
import '../../custom_withdrawal_body.dart';

class WithdrawalWelcomeScreen extends StatelessWidget {
  const WithdrawalWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWithdrawalBody(
      navigationButton: CustomWithdrawalBody.nextButton(
          context: context,
          nextTo: WithdrawalPages.bankDetail,
          disableButton: false),
      children: [
        const CustomText('Withdrawal', type: FontType.h1),
        const SizedBox(
          height: 50,
        ),
        const CustomText(
          'Withdrawal will be credited to the bank account you used to deposit with. Please note that we are unable to credit to another bank account.',
          type: FontType.smallTextBold,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(
          height: 20,
        ),
        _customRow('1', 'Tell us how much you want to withdraw'),
        _customRow('2', 'Confirm your bank account details'),
        _customRow('3', 'Sit back and relax'),
      ],
    );
  }

  Widget _customRow(String index, String text) => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: CustomText(
                  '$index.',
                  type: FontType.bodyTextBold,
                )),
            Expanded(
                flex: 14,
                child: CustomText(
                  text,
                  type: FontType.bodyTextBold,
                )),
          ],
        ),
      );
}
