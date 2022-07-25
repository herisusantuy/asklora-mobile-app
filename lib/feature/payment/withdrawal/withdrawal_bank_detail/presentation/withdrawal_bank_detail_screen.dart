import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../presentation/custom_payment_text_input.dart';
import '../../bloc/withdrawal_bloc.dart';
import '../../presentation/custom_withdrawal_body.dart';
import '../bloc/withdrawal_bank_detail_bloc.dart';

class WithdrawalBankDetailScreen extends StatelessWidget {
  const WithdrawalBankDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWithdrawalBody(
      backTo: WithdrawalPages.welcome,
      navigationButton:
          BlocBuilder<WithdrawalBankDetailBloc, WithdrawalBankDetailState>(
        buildWhen: (previous, current) =>
            previous.nextButtonDisable != current.nextButtonDisable,
        builder: (context, state) => CustomWithdrawalBody.nextButton(
            context: context,
            nextTo: WithdrawalPages.amount,
            disableButton: state.nextButtonDisable),
      ),
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
            onChanged: (value) => context
                .read<WithdrawalBankDetailBloc>()
                .add(AccountNumberChanged(value))),
        CustomPaymentTextInput(
            labelText: 'Bank Name',
            hintText: 'THE HONG KONG AND SHANGHAI BANKING CORPORATION LIMITED',
            onChanged: (value) => context
                .read<WithdrawalBankDetailBloc>()
                .add(BankNameChanged(value))),
        CustomPaymentTextInput(
            labelText: 'Bank No.',
            hintText: 'Bank No.',
            onChanged: (value) => context
                .read<WithdrawalBankDetailBloc>()
                .add(BankNumberChanged(value))),
        CustomPaymentTextInput(
            labelText: 'Account Name',
            hintText: 'Account Name',
            onChanged: (value) => context
                .read<WithdrawalBankDetailBloc>()
                .add(AccountNameChanged(value))),
      ],
    );
  }
}
