import 'package:flutter/material.dart';

class KycScreen extends StatelessWidget {
  static const String route = '/kyc';

  const KycScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);

  static void openReplace(BuildContext context) =>
      Navigator.of(context).pushReplacementNamed(route);

  static void openRemoveUntil(BuildContext context, String removeUntil) =>
      Navigator.of(context)
          .pushNamedAndRemoveUntil(route, ModalRoute.withName(removeUntil));
}
