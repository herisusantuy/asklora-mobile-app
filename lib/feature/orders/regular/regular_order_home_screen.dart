import 'package:flutter/material.dart';

class RegularOrderHomeScreen extends StatelessWidget {
  static const String route = '/order_regular';

  const RegularOrderHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: const Center(
        child: Text('Reset password sent successfully.'),
      ),
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
