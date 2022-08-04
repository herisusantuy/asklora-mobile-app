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

  final WithdrawalPages initialWithdrawalPages;

  const WithdrawalScreen(
      {this.initialWithdrawalPages = WithdrawalPages.welcome, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => WithdrawalBloc(),
        ),
        BlocProvider(
          create: (_) => AmountBloc(),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<WithdrawalBloc, WithdrawalState>(
          builder: (context, state) => pages(
              state.withdrawalPages == WithdrawalPages.unknown
                  ? initialWithdrawalPages
                  : state.withdrawalPages),
        ),
      ),
    );
  }

  Widget pages(WithdrawalPages withdrawPages) {
    switch (withdrawPages) {
      case WithdrawalPages.welcome:
        return const WelcomeScreen();
      case WithdrawalPages.bankDetail:
        return const BankDetailScreen();
      case WithdrawalPages.amount:
        return const AmountScreen();
      case WithdrawalPages.acknowledgement:
        return const AcknowledgementScreen();
      default:
        return const SizedBox.shrink();
    }
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
