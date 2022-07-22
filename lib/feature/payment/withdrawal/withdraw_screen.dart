import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/withdraw_bloc.dart';
import 'withdrawal_bank_detail/presentation/withdrawal_bank_detail_screen.dart';
import 'withdrawal_welcome_screen/presentation/withdrawal_welcome_screen.dart';

class WithdrawScreen extends StatelessWidget {
  static const String route = '/withdraw_screen';

  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WithdrawBloc(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: BlocBuilder<WithdrawBloc, WithdrawState>(
          builder: (context, state) => pages(state.withdrawPages),
        ),
      ),
    );
  }

  Widget pages(WithdrawPages withdrawPages) {
    switch (withdrawPages) {
      case WithdrawPages.welcome:
        return const WithdrawalWelcomeScreen();
      case WithdrawPages.bankDetail:
        return const WithdrawalBankDetailScreen();
    }
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
