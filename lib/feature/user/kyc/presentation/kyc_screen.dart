import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';
import 'basic_information_screen.dart';

class KycScreen extends StatelessWidget {
  const KycScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BasicInformationScreen();
  }

  static void open(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const KycScreen()));
}
