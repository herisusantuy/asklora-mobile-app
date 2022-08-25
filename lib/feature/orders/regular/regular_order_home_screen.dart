import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/order_bloc.dart';
import '../presentations/order_screen.dart';

class RegularOrderHomeScreen extends StatelessWidget {
  static const String route = '/order_regular';

  const RegularOrderHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => OrderBloc(),
        child: OrderScreen(symbolDetail: SymbolDetail('AAPL.O', '100')),
      ),
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
