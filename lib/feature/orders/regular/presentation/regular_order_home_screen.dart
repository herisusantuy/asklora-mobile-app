import 'package:flutter/material.dart';

import 'order_type_screen.dart';
import 'regular_order_symbol_details_screen.dart';

class RegularOrderHomeScreen extends StatelessWidget {
  static const String route = '/order_regular';

  const RegularOrderHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('')),
        body: const OrderTypeScreen(
          orderType: OrderType.buy,
        ));
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
