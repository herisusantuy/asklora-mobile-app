import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/alert_dialog.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_information.dart';
import '../../bloc/bank_account_bloc.dart';
import '../../deposits/bloc/navigation_bloc/navigation_bloc.dart';
import '../../domain/get_bank_account_response.dart';
import '../../presentation/custom_payment_button_button.dart';
import '../../presentation/custom_payment_text_input.dart';
import '../../presentation/payment_confirmation_dialog.dart';
import '../bloc/amount/amount_bloc.dart';
import '../bloc/withdrawal_bloc.dart';
import 'widget/custom_withdrawal_widget.dart';

class AmountScreen extends StatelessWidget {
  const AmountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWithdrawalWidget(
      title: 'Input Withdrawal Amount',
      navigationButton: BlocBuilder<AmountBloc, AmountState>(
          buildWhen: (previous, current) =>
              current.withdrawalAmountErrorType !=
                  previous.withdrawalAmountErrorType ||
              previous.withdrawalUSDAmount != current.withdrawalUSDAmount,
          builder: (context, state) => CustomPaymentButton(
                key: const Key('withdrawal_submit_button'),
                title: 'Request Withdrawal',
                onSubmit: () => _showConfirmationAmount(
                    context, state.withdrawalUSDAmount.toString()),
                disable:
                    state.withdrawalAmountErrorType != AmountErrorType.unknown,
              )),
      child: ListView(
        children: [
          const CustomText(
            'Please tell us how much you wish to withdraw',
            type: FontType.h5,
            padding: EdgeInsets.only(bottom: 30),
          ),
          _withdrawalAmountInput(context),
          _exchangeArrowIcon(),
          _estimatedHKDAmount(),
          _noteOfExchangeRate(),
        ],
      ),
    );
  }

  Widget _exchangeArrowIcon() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.arrow_upward,
            size: 42,
          ),
          Icon(
            Icons.arrow_downward,
            size: 42,
          ),
        ],
      );

  Widget _noteOfExchangeRate() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.info_outline,
            size: 18,
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: CustomText(
              'Please note that this is an estimated quote based on the interbank exchange rate. The final amount may differ slightly based on exchange rate at the time of conversion',
              type: FontType.smallText,
            ),
          ),
        ],
      );

  void _showConfirmationAmount(BuildContext context, String amount) {
    GetBankAccountResponse? fps = context
        .read<BankAccountBloc>()
        .state
        .response
        .data
        ?.fpsBankAccounts?[0];
    showModalBottomSheet(
        context: context,
        builder: (_) => BlocProvider.value(
              value: BlocProvider.of<WithdrawalBloc>(context),
              child: BlocConsumer<WithdrawalBloc, WithdrawalState>(
                listener: (context, state) {
                  if (state.response.state == ResponseState.success) {
                    Navigator.pop(context);
                    context.read<NavigationBloc<WithdrawalPagesStep>>().add(
                        const PageChanged(WithdrawalPagesStep.acknowledgement));
                  } else if (state.response.state == ResponseState.error) {
                    Navigator.pop(context);
                    showAlertDialog(context, state.response.message,
                        onPressedOk: () {});
                  }
                },
                builder: (context, state) => PaymentConfirmationDialog(
                    title: 'Withdrawal Amount (USD)',
                    amount: amount,
                    closeOnSubmit: false,
                    bankAccountName: fps?.accountName ?? '',
                    bankName: '${fps?.name ?? ''} (${fps?.bankCode ?? ''})',
                    isLoading: state.response.state == ResponseState.loading,
                    warningText:
                        'Please note that the deposit amount cannot exceed the account balance in your bank. Otherwise, your bank may charge you extra fees due to transaction failures',
                    onSubmit: () => context
                        .read<WithdrawalBloc>()
                        .add(WithdrawalSubmitted(amount))),
              ),
            ));
  }

  Widget _estimatedHKDAmount() => Padding(
        key: const Key('estimated_hkd_amount_text'),
        padding: const EdgeInsets.only(top: 36, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<AmountBloc, AmountState>(
                buildWhen: (previous, current) =>
                    previous.withdrawalHKDAmount != current.withdrawalHKDAmount,
                builder: (context, state) => CustomTextInformation(
                      title: 'Estimated HKD Amount',
                      label: '${state.withdrawalHKDAmount}',
                      paddingBottom: 6,
                    )),
            const CustomText(
              'Exchange Rate: HKD 1 = Approx. USD 0.1274',
              type: FontType.smallText,
            )
          ],
        ),
      );

  Widget _withdrawalAmountInput(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPaymentTextInput(
                key: const Key('withdrawal_amount_input'),
                titleText: 'Withdrawal Amount',
                textInputType: TextInputType.number,
                textInputFormatterList: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                prefixText: 'USD',
                paddingBottom: 6,
                hintText: 'Enter Amount',
                onChanged: (value) => context.read<AmountBloc>().add(
                    WithdrawalAmountChanged(
                        value.isNotEmpty ? double.parse(value) : 0))),
            const SizedBox(
              height: 6,
            ),
            BlocBuilder<AmountBloc, AmountState>(
                buildWhen: (previous, current) =>
                    previous.withdrawalMaxAmount != current.withdrawalMaxAmount,
                builder: (context, state) => CustomText(
                      'Available amount to withdraw : USD ${state.withdrawalMaxAmount}',
                      type: FontType.bodyText,
                    )),
            const SizedBox(
              height: 6,
            ),
            BlocBuilder<AmountBloc, AmountState>(
                buildWhen: (previous, current) =>
                    current.withdrawalAmountErrorType !=
                    previous.withdrawalAmountErrorType,
                builder: (context, state) => state.withdrawalAmountErrorType ==
                        AmountErrorType.exceedMaxAmount
                    ? const CustomText(
                        'Withdrawal amount cannot exceed your buying power',
                        key: Key('withdrawal_exceed_amount_error_text'),
                        type: FontType.smallText,
                        color: Colors.red,
                      )
                    : const SizedBox.shrink())
          ],
        ),
      );
}
