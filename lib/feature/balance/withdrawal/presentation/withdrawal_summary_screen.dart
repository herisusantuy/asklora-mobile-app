import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/utils/extensions.dart';
import '../../widgets/balance_base_form.dart';
import '../bloc/withdrawal_bloc.dart';
import '../repository/withdrawal_repository.dart';
import 'withdrawal_result_screen.dart';

class WithdrawalSummaryScreen extends StatelessWidget {
  static const String route = '/withdrawal_summary_screen';
  final double withdrawalAmount;

  const WithdrawalSummaryScreen({required this.withdrawalAmount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WithdrawalBloc(
        withdrawalRepository: WithdrawalRepository(),
      ),
      child: BlocListener<WithdrawalBloc, WithdrawalState>(
        listener: (context, state) {
          if (state.response.state == ResponseState.loading) {
            CustomLoadingOverlay.show(context);
          } else if (state.response.state == ResponseState.error) {
            ///LETS ASSUME ERROR AS SUCCEED FOR NOW TO SHOW THE RESULT SCREEN
            CustomLoadingOverlay.dismiss();
            // CustomInAppNotification.show(context, state.response.message);
            WithdrawalResultScreen.open(context);
          } else if (state.response.state == ResponseState.success) {
            CustomLoadingOverlay.dismiss();
            WithdrawalResultScreen.open(context);
          }
        },
        child: BalanceBaseForm(
          title: 'Withdrawal',
          content: Column(
            children: [
              getPngImage('money'),
              const SizedBox(
                height: 65,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 0.5,
                      color: AskLoraColors.gray,
                    ),
                    bottom: BorderSide(
                      width: 0.5,
                      color: AskLoraColors.gray,
                    ),
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: _textInfo(
                    title: 'TO', subTitle: 'Hang Sang Bank (123-*******-189)'),
              ),
              const SizedBox(
                height: 21,
              ),
              _textInfo(
                  title: 'WITHDRAWAL AMOUNT',
                  subTitle: 'HKD $_withdrawalAmount'),
              const SizedBox(
                height: 24,
              ),
              _textInfo(title: 'TRANSACTION FEE', subTitle: 'HKD -80'),
              const Divider(
                thickness: 2,
                color: AskLoraColors.charcoal,
                height: 38,
              ),
              _textInfo(title: 'TOTAL AMOUNT', subTitle: 'HKD $_totalAmount'),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
          bottomButton: _bottomButton(context),
        ),
      ),
    );
  }

  String get _totalAmount => (withdrawalAmount - 80).convertToCurrencyDecimal();

  String get _withdrawalAmount => withdrawalAmount.convertToCurrencyDecimal();

  Widget _bottomButton(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            CustomTextNew(
              'Your withdrawal can take up to 2 working days.',
              style: AskLoraTextStyles.subtitle3
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<WithdrawalBloc, WithdrawalState>(
                builder: (context, state) {
              return PrimaryButton(
                disabled: state.response.state == ResponseState.loading,
                label: 'CONFIRM',
                onTap: () => context.read<WithdrawalBloc>().add(
                      SubmitWithdrawal(withdrawalAmount),
                    ),
              );
            })
          ],
        ),
      );

  Widget _textInfo({required String title, required String subTitle}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextNew(
            title,
            style: AskLoraTextStyles.subtitleAllCap1
                .copyWith(color: AskLoraColors.charcoal),
          ),
          Flexible(
            child: CustomTextNew(
              subTitle,
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
          ),
        ],
      );

  static void open(BuildContext context, {required double withdrawalAmount}) =>
      Navigator.pushNamed(context, route, arguments: withdrawalAmount);
}
