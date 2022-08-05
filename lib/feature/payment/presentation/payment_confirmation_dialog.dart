import 'package:flutter/material.dart';

import '../../../core/presentation/custom_text.dart';
import 'custom_payment_button_button.dart';

class PaymentConfirmationDialog extends StatelessWidget {
  final String title;
  final String amount;
  final String bankAccountName;
  final String bankName;
  final String warningText;
  final Function onSubmit;

  const PaymentConfirmationDialog(
      {required this.title,
      required this.amount,
      required this.onSubmit,
      required this.bankName,
      required this.bankAccountName,
      required this.warningText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.close,
                          size: 32,
                        ))),
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    title,
                    type: FontType.smallText,
                    padding: const EdgeInsets.only(bottom: 12),
                  ),
                ),
              ],
            ),
            CustomText(
              amount,
              type: FontType.h5,
              padding: const EdgeInsets.only(bottom: 16),
            ),
            Row(
              children: [
                CustomText(
                  bankAccountName,
                  padding: const EdgeInsets.only(right: 12),
                  type: FontType.smallText,
                ),
                Expanded(
                    child: CustomText(
                  bankName,
                  type: FontType.smallText,
                )),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(6)),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 18,
                  ),
                  Expanded(
                      child: CustomText(
                    warningText,
                    type: FontType.smallText,
                    padding: const EdgeInsets.only(left: 12),
                  ))
                ],
              ),
            ),
            CustomPaymentButton(
                key: const Key('payment_confirmation_continue_button'),
                title: 'Continue',
                onSubmit: () {
                  Navigator.pop(context);
                  onSubmit();
                },
                disable: false)
          ],
        ),
      ),
    );
  }
}
