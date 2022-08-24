import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';
import 'widget/custom_withdrawal_widget.dart';

class AcknowledgementScreen extends StatelessWidget {
  const AcknowledgementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWithdrawalWidget(
      crossAxisAlignment: CrossAxisAlignment.center,
      header: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const CustomText(
                'Done',
                type: FontType.bodyTextBold,
              )),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(top: 48, bottom: 48),
            color: Colors.grey[300],
            child: const Center(
              child: CustomText(
                '-Image-',
                key: Key('withdrawal_acknowledgement_image'),
                type: FontType.bodyText,
              ),
            ),
          ),
          const CustomText(
            'Acknowledgement',
            type: FontType.h5,
            padding: EdgeInsets.only(bottom: 12),
          ),
          const CustomText(
            'We\'re processing your transaction. We\'ll let you know via push notification and email as we\'ve sent the funds your way',
            type: FontType.smallText,
            textAlign: TextAlign.center,
            padding: EdgeInsets.only(bottom: 24),
          ),
          const CustomText(
            'This can usually take 1-2 business days',
            type: FontType.smallText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
