import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../onboarding/kyc/repository/account_repository.dart';
import '../../../settings/bloc/account_information/account_information_bloc.dart';
import '../../widgets/balance_base_form.dart';
import '../../widgets/bank_account_card.dart';
import 'withdrawal_amount/withdrawal_amount_screen.dart';

class WithdrawalBankDetailScreen extends StatelessWidget {
  static const String route = '/withdrawal_bank_detail_screen';

  const WithdrawalBankDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AccountInformationBloc(accountRepository: AccountRepository())
            ..add(GetLocalAccountInformation()),
      child: BlocConsumer<AccountInformationBloc, AccountInformationState>(
        listener: (context, state) {
          CustomLoadingOverlay.of(context).show(state.response.state);
        },
        builder: (context, state) {
          if (state.response.state == ResponseState.success &&
              state.response.data?.bankAccount != null) {
            return BalanceBaseForm(
              content: BankAccountCard(
                bankAccount: state.response.data!.bankAccount!,
              ),
              bottomButton: _bottomButton(context),
              title: 'Withdraw',
            );
          } else {
            ///TODO : change to error UI later if any
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _bottomButton(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 30),
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
            ButtonPair(
                primaryButtonOnClick: () =>
                    WithdrawalAmountScreen.open(context),
                secondaryButtonOnClick: () {},
                primaryButtonLabel: 'NEXT',
                secondaryButtonLabel: 'CHANGE BANK ACCOUNT')
          ],
        ),
      );

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
