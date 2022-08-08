import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';
import '../bloc/deposit_bloc.dart';
import '../shareable/widget/custom_deposit_widget.dart';
import '../shareable/widget/deposit_next_button.dart';

class DepositWelcomeScreen extends StatelessWidget {
  const DepositWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
      navigationButton: const DepositNextButton(
        key: Key('deposit_welcome_screen_next_button'),
        nextTo: DepositPageStep.depositMethod,
        disable: false,
      ),
      children: [
        const CustomText(
          'Deposit',
          key: Key('title_deposit_welcome_screen'),
          padding: EdgeInsets.only(top: 10, bottom: 50),
          type: FontType.h2,
        ),
        const CustomText(
          'LORA allows you to deposit either through wire or FPS. Here are the steps that you need to take to deposit with us:',
          key: Key('subtitle_deposit_welcome_screen'),
          padding: EdgeInsets.only(top: 10, bottom: 30),
          type: FontType.smallTextBold,
        ),
        _customTextRow('1', 'Tell us your bank account details'),
        _customTextRow(
            '2', 'Transfer to LORA’s bank account through your bank'),
        _customTextRow('3', 'Tell us how much you’ve deposited'),
        _customTextRow('4', 'Upload proof of remittance'),
      ],
    );
  }

  Widget _customTextRow(String index, String text) => Padding(
        padding: const EdgeInsets.only(top: 3.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: CustomText('$index.', type: FontType.bodyTextBold)),
            Expanded(
                flex: 14, child: CustomText(text, type: FontType.bodyTextBold))
          ],
        ),
      );
}
