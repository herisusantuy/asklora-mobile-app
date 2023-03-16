import 'package:flutter/material.dart';

import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/round_colored_box.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';

class BankAccountCard extends StatelessWidget {
  const BankAccountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RoundColoredBox(
        title: 'Hang Seng Bank Limited',
        content: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(children: [
            CustomTextNew(
              '123 - 1256789 - 07',
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.charcoal),
              maxLines: 2,
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextNew(
              'Lillian Lambert',
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.charcoal),
              maxLines: 2,
            ),
          ]),
        ),
      ),
    );
  }
}
