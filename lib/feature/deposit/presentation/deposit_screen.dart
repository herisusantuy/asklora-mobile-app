import 'package:flutter/material.dart';

import '../../../core/presentation/custom_text.dart';
import '../../../core/presentation/custom_text_button.dart';
import 'deposit_screen_1/deposit_screen_1.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    _customTextRow('2',
                        'Transfer to LORA’s bank account through your bank'),
                    _customTextRow('3', 'Tell us how much you’ve deposited'),
                    _customTextRow('4', 'Upload proof of remittance'),
                  ],
                ),
              )),
              _nextButton(context),
            ],
          ),
        ),
      ),
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

  Widget _nextButton(context) => Padding(
        padding: EdgeInsets.zero,
        child: CustomTextButton(
            key: const Key('deposit_screen_next_button'),
            borderRadius: 5,
            buttonText: 'Next',
            onClick: () => DepositScreen1.open(context)),
      );

  static void open(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const DepositScreen()));
}
