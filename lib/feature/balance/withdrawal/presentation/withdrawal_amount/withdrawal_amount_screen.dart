import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_key_pad/custom_key_pad.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../../generated/l10n.dart';
import '../../bloc/withdrawal_bloc.dart';
import '../../repository/withdrawal_repository.dart';
import '../withdrawal_summary_screen.dart';

part 'widgets/withdrawal_amount_value.dart';

part 'widgets/withdrawal_key_pad.dart';

class WithdrawalAmountScreen extends StatelessWidget {
  static const String route = '/withdrawal_amount_screen';

  final double withdrawableBalance;

  const WithdrawalAmountScreen(this.withdrawableBalance, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WithdrawalBloc(
        withdrawalRepository: WithdrawalRepository(),
      ),
      child: CustomScaffold(
          body: Padding(
        padding: AppValues.screenHorizontalPadding,
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: CustomTextNew(
                  'Withdraw',
                  style: AskLoraTextStyles.h5
                      .copyWith(color: AskLoraColors.charcoal),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Column(
                children: [
                  WithdrawalAmountValue(
                      withdrawableBalance: withdrawableBalance),
                  const WithdrawalKeyPad(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: BlocBuilder<WithdrawalBloc, WithdrawalState>(
                buildWhen: (previous, current) =>
                    previous.withdrawalAmount != current.withdrawalAmount,
                builder: (context, state) => PrimaryButton(
                  disabled: state.disableWithdrawal(withdrawableBalance),
                  label: S.of(context).buttonNext,
                  onTap: () => WithdrawalSummaryScreen.open(context,
                      withdrawalAmount: context
                          .read<WithdrawalBloc>()
                          .state
                          .withdrawalAmount),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  static void open(BuildContext context, double withdrawableBalance) =>
      Navigator.pushNamed(context, route, arguments: withdrawableBalance);
}
