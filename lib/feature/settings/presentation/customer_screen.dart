import 'package:flutter/material.dart';

import '../../../core/domain/endpoints.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../core/utils/utils.dart';

class CustomerServiceScreen extends StatelessWidget {
  const CustomerServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        onTapBack: () => Navigator.pop(context),
        body: CustomStretchedLayout(
            header: const CustomHeader(title: 'Customer Service'),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () => openUrl(mailToLora),
                      child:
                          text(title: 'Email', value: 'loracares@asklora.ai')),
                  const SizedBox(height: 22),
                  text(title: 'Office Hours', value: '09:00-18:00 (HKT)'),
                ],
              ),
            )));
  }

  Widget text({required String title, required String value}) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNew(title, style: AskLoraTextStyles.body1),
            CustomTextNew(value, style: AskLoraTextStyles.body1),
          ],
        ),
      ],
    );
  }

  static void open(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const CustomerServiceScreen(),
        ),
      );
}
