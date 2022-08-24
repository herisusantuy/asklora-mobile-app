import '../../bloc/bank_account_bloc.dart';
import '../../deposits/bloc/navigation_bloc/navigation_bloc.dart';
import '../../repository/bank_account_repository.dart';
import '../repository/withdrawal_repository.dart';
import 'welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/amount/amount_bloc.dart';
import '../bloc/withdrawal_bloc.dart';
import 'acknowledgement_screen.dart';
import 'amount_screen.dart';
import 'bank_detail_screen.dart';

class WithdrawalScreen extends StatelessWidget {
  static const String route = '/withdrawal_screen';

  final WithdrawalPagesStep initialWithdrawalPages;

  const WithdrawalScreen(
      {this.initialWithdrawalPages = WithdrawalPagesStep.welcome, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => NavigationBloc(initialWithdrawalPages),
          ),
          BlocProvider(
            create: (_) =>
                BankAccountBloc(bankAccountRepository: BankAccountRepository()),
          ),
          BlocProvider(
            create: (_) =>
                WithdrawalBloc(withdrawalRepository: WithdrawalRepository()),
          ),
          BlocProvider(
            create: (_) => AmountBloc(),
          ),
        ],
        child: Scaffold(
          body: BlocConsumer<NavigationBloc<WithdrawalPagesStep>,
              NavigationState<WithdrawalPagesStep>>(
            listenWhen: (_, current) => current.lastPage == true,
            listener: (context, state) {
              Navigator.pop(context);
            },
            builder: (context, state) => _pages(context, state),
          ),
        ));
  }

  Widget _pages(BuildContext context, NavigationState navigationState) {
    switch (navigationState.page) {
      case WithdrawalPagesStep.welcome:
        return const WelcomeScreen();
      case WithdrawalPagesStep.bankDetail:
        return BankDetailScreen(
            fpsAccount: context
                .read<BankAccountBloc>()
                .state
                .response
                .data
                ?.fpsBankAccounts?[0]);
      case WithdrawalPagesStep.amount:
        return const AmountScreen();
      case WithdrawalPagesStep.acknowledgement:
        return const AcknowledgementScreen();
      default:
        return const SizedBox.shrink();
    }
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
