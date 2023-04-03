import 'package:flutter/material.dart';

import '../../../core/domain/endpoints.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/utils/utils.dart';
import '../widget/menu_button.dart';
import 'customer_screen.dart';

class GetHelpScreen extends StatelessWidget {
  const GetHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        onTapBack: () => Navigator.pop(context),
        body: CustomStretchedLayout(
            header: CustomHeader(title: 'Get Help'),
            content: Column(
              children: [
                MenuButtonWidget(
                    title: 'FAQ', onTap: () => openUrl(askloraFaq)),
                MenuButtonWidget(
                    title: 'Customer Service',
                    onTap: () => CustomerServiceScreen.open(context)),
              ],
            )));
  }

  static void open(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const GetHelpScreen(),
        ),
      );
}
