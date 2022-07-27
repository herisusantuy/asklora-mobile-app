import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/withdrawal_bloc.dart';
import '../withdrawal_amount/bloc/withdrawal_amount_bloc.dart';
import '../withdrawal_amount/presentation/withdrawal_amount_screen.dart';
import '../withdrawal_bank_detail/presentation/withdrawal_bank_detail_screen.dart';
import '../withdrawal_welcome_screen/presentation/withdrawal_welcome_screen.dart';

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
          create: (_) => WithdrawalAmountBloc(),
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
        return const WithdrawalWelcomeScreen();
      case WithdrawalPages.bankDetail:
        return const WithdrawalBankDetailScreen();
      case WithdrawalPages.amount:
        return const WithdrawalAmountScreen();
      default:
        return const SizedBox.shrink();
    }
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
