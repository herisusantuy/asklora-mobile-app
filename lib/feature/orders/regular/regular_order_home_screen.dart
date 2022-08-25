import 'package:flutter/material.dart';
import '../presentations/shareable_order_screen.dart';
import '../utils/type.dart';

class RegularOrderHomeScreen extends StatelessWidget {
  static const String route = '/order_regular';

  const RegularOrderHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShareableOrderScreen(
          transactionType: TransactionType.buy,
          initialOrderType: OrderType.limit,
          stockModel: StockModel('AAPL.O', '100')),
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
