import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../presentation/custom_payment_button_button.dart';
import '../../../presentation/custom_payment_text_input.dart';
import '../../bloc/withdrawal_bloc.dart';
import '../../presentation/custom_withdrawal_text_information_widget.dart';
import '../../presentation/custom_withdrawal_widget.dart';
import '../bloc/withdrawal_amount_bloc.dart';

class WithdrawalAmountScreen extends StatelessWidget {
  const WithdrawalAmountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWithdrawalWidget(
      title: 'Input Withdrawal Amount',
      backTo: WithdrawalPages.bankDetail,
      navigationButton:
          BlocBuilder<WithdrawalAmountBloc, WithdrawalAmountState>(
              buildWhen: (previous, current) =>
                  current.withdrawalAmountErrorType !=
                  previous.withdrawalAmountErrorType,
              builder: (context, state) => CustomPaymentButton(
                    key: const Key('withdrawal_submit_button'),
                    title: 'Request Withdrawal',
                    onSubmit: () => context.read<WithdrawalBloc>().add(
                        const PageChanged(WithdrawalPages.acknowledgement)),
                    disable: state.withdrawalAmountErrorType !=
                        WithdrawalAmountErrorType.unknown,
                  )),
      children: [
        const CustomText(
          'Please tell us how much you wish to withdraw',
          type: FontType.h5,
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

  Widget _estimatedHKDAmount() => Padding(
        key: const Key('estimated_hkd_amount_text'),
        padding: const EdgeInsets.only(top: 36, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<WithdrawalAmountBloc, WithdrawalAmountState>(
                buildWhen: (previous, current) =>
                    previous.withdrawalHKDAmount != current.withdrawalHKDAmount,
                builder: (context, state) =>
                    CustomWithdrawalTextInformationWidget(
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
                textInputType: TextInputType.number,
                textInputFormatterList: [
                  FilteringTextInputFormatter.digitsOnly
                ],
                paddingBottom: 6,
                labelText: 'Withdrawal Amount',
                hintText: 'Enter Amount',
                onChanged: (value) => context.read<WithdrawalAmountBloc>().add(
                    WithdrawalAmountChanged(
                        value.isNotEmpty ? double.parse(value) : 0))),
            const SizedBox(
              height: 6,
            ),
            BlocBuilder<WithdrawalAmountBloc, WithdrawalAmountState>(
                buildWhen: (previous, current) =>
                    previous.withdrawalMaxAmount != current.withdrawalMaxAmount,
                builder: (context, state) => CustomText(
                      'Available amount to withdraw : USD ${state.withdrawalMaxAmount}',
                      type: FontType.bodyText,
                    )),
            const SizedBox(
              height: 6,
            ),
            BlocBuilder<WithdrawalAmountBloc, WithdrawalAmountState>(
                buildWhen: (previous, current) =>
                    current.withdrawalAmountErrorType !=
                    previous.withdrawalAmountErrorType,
                builder: (context, state) => state.withdrawalAmountErrorType ==
                        WithdrawalAmountErrorType.exceedMaxAmount
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
