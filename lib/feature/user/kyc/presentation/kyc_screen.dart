import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';

class KycScreen extends StatelessWidget {
  static const String route = '/kyc';

  const KycScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KYC'),
        elevation: 0,
      ),
      body: const Center(child: CustomText('KYC Screen')),
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);

  static void openReplace(BuildContext context) =>
      Navigator.of(context).pushReplacementNamed(route);

  static void openRemoveUntil(BuildContext context, String removeUntil) =>
      Navigator.of(context)
          .pushNamedAndRemoveUntil(route, ModalRoute.withName(removeUntil));
}
