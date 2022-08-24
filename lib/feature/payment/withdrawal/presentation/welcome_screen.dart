import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/alert_dialog.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../bloc/bank_account_bloc.dart';
import '../../presentation/custom_payment_button_button.dart';
import '../bloc/withdrawal_bloc.dart';
import 'widget/custom_withdrawal_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWithdrawalWidget(
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
          onSubmit: () => context
              .read<BankAccountBloc>()
              .add(const RegisteredBankAccountCheck()),
          isLoading: state.response.state == ResponseState.loading,
          disable: false,
        ),
      ),
      child: Column(
        children: [
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
      ),
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
