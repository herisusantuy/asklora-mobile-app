import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../presentation/custom_payment_button_button.dart';
import '../../presentation/custom_payment_text_input.dart';
import '../bloc/amount/amount_bloc.dart';
import '../bloc/withdrawal_bloc.dart';
import 'widget/custom_withdrawal_text_information_widget.dart';
import 'widget/custom_withdrawal_widget.dart';

class AmountScreen extends StatelessWidget {
  const AmountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWithdrawalWidget(
      title: 'Input Withdrawal Amount',
      backTo: WithdrawalPages.bankDetail,
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

  void _showConfirmationAmount(BuildContext context, String amount) =>
      showModalBottomSheet(
          context: context,
          builder: (_) => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: const Icon(
                                  Icons.close,
                                  size: 32,
                                ))),
                        const Align(
                          alignment: Alignment.center,
                          child: CustomText(
                            'Withdrawal Amount (USD)',
                            type: FontType.smallText,
                            padding: EdgeInsets.only(bottom: 12),
                          ),
                        ),
                      ],
                    ),
                    CustomText(
                      amount,
                      type: FontType.h5,
                      padding: const EdgeInsets.only(bottom: 16),
                    ),
                    Row(
                      children: const [
                        CustomText(
                          'Payer\'s account',
                          padding: EdgeInsets.only(right: 12),
                          type: FontType.smallText,
                        ),
                        Expanded(
                            child: CustomText(
                          '004 The Hong Kong and Shanghai Banking Corporation Limited (7890)',
                          type: FontType.smallText,
                        )),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(6)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      margin: const EdgeInsets.only(top: 24),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.info_outline,
                            size: 18,
                          ),
                          Expanded(
                              child: CustomText(
                            'Please note that we are unable to cancel your withdrawal request once you have submitted it.',
                            type: FontType.smallText,
                            padding: EdgeInsets.only(left: 12),
                          ))
                        ],
                      ),
                    ),
                    CustomPaymentButton(
                        key: const Key('withdrawal_continue_button'),
                        title: 'Continue',
                        onSubmit: () {
                          Navigator.pop(context);
                          context.read<WithdrawalBloc>().add(const PageChanged(
                              WithdrawalPages.acknowledgement));
                        },
                        disable: false)
                  ],
                ),
              ));

  Widget _estimatedHKDAmount() => Padding(
        key: const Key('estimated_hkd_amount_text'),
        padding: const EdgeInsets.only(top: 36, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<AmountBloc, AmountState>(
                buildWhen: (previous, current) =>
                    previous.withdrawalHKDAmount != current.withdrawalHKDAmount,
                builder: (context, state) => CustomPaymentTextInformationWidget(
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
