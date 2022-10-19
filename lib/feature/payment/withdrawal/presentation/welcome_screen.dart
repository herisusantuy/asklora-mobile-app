import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/alert_dialog.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/bank_account_bloc.dart';
import '../../presentation/custom_payment_button_button.dart';
import '../bloc/withdrawal_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<WithdrawalPagesStep>(
      title: 'Withdrawal',
      navigationButton: BlocConsumer<BankAccountBloc, BankAccountState>(
        listener: (context, state) {
          if (state.response.state == ResponseState.success &&
              state.response.data!.fpsBankAccounts!.isNotEmpty) {
            context
                .read<NavigationBloc<WithdrawalPagesStep>>()
                .add(const PageChanged(WithdrawalPagesStep.bankDetail));
          } else if (state.response.state == ResponseState.success &&
              state.response.data!.fpsBankAccounts!.isEmpty) {
            showAlertDialog(context, "You don't have FPS account yet",
                onPressedOk: () {});
          } else if (state.response.state == ResponseState.error) {
            showAlertDialog(context, state.response.message,
                onPressedOk: () {});
          }
        },
        builder: (context, state) => CustomPaymentButton(
          key: const Key('withdrawal_welcome_screen_next_button'),
          title: 'Next',
          onSubmit: () => showAlertDialog(context,
              'Please note that for withdrawals, there is a cutoff time of 17:00HKT. If you withdraw after this time, your request will be processed in the next business day',
              title: '',
              onPressedOk: () => context
                  .read<BankAccountBloc>()
                  .add(const RegisteredBankAccountCheck())),
          isLoading: state.response.state == ResponseState.loading,
          disable: false,
        ),
      ),
      child: ListView(
        children: [
          const CustomText(
            'Withdrawals will be credited to the bank account you used to deposit with. Please note that you are unable to withdraw funds to another bank account for regulatory purposes',
            key: Key('subtitle_withdrawal_welcome_screen'),
            type: FontType.smallText,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(
            height: 20,
          ),
          _customTextRow('1', 'Confirm your bank account details'),
          _customTextRow('2', 'Tell us how much you want to withdraw'),
          const SizedBox(
            height: 32,
          ),
          ..._withdrawalNotes
        ],
      ),
    );
  }

  List<Widget> get _withdrawalNotes => [
        const CustomText(
          'Notes:',
          key: Key('withdrawal_notes'),
          padding: EdgeInsets.only(bottom: 6),
          type: FontType.smallText,
        ),
        _customTextRow('1',
            'We work with Alpaca Securities LLC (“Alpaca”) in the US to handle your funds. Your withdrawal request will be sent to Alpaca every business day and we will send the funds to your bank account as soon as it arrives in HK. As such, please note that by law, we do not hold your funds in HK for more than 24 hours',
            fontType: FontType.smallText),
        _customTextRow('2',
            'Funds will be credited back to your bank account on a best effort basis as soon as we request and receive your funds from Alpaca, but there is no guarantee that your withdrawal request will be fulfilled within the estimated time period. Normally, withdrawals take between 2 - 4 business days.',
            fontType: FontType.smallText),
      ];

  Widget _customTextRow(String index, String text,
          {FontType fontType = FontType.bodyTextBold}) =>
      Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: CustomText(
                  '$index.',
                  type: fontType,
                )),
            Expanded(
                flex: 14,
                child: CustomText(
                  text,
                  type: fontType,
                )),
          ],
        ),
      );
}
