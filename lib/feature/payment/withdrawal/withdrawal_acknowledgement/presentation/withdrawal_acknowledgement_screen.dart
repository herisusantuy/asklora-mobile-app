import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../auth/sign_in/presentation/sign_in_success_screen.dart';
import '../../../presentation/custom_payment_button_button.dart';
import '../../presentation/custom_withdrawal_widget.dart';

class WithdrawalAcknowledgementScreen extends StatelessWidget {
  const WithdrawalAcknowledgementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomWithdrawalWidget(
      title: '',
      navigationButton: CustomPaymentButton(
          key: const Key('withdrawal_acknowledgement_submit_button'),
          title: 'Home',
          disable: false,
          onSubmit: () => SignInSuccessScreen.openAndRemoveAllRoute(context)),
      children: const [
        Align(
          alignment: Alignment.center,
          child: CustomText(
            'Instruction Received',
            type: FontType.h2,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        CustomText(
          'We`ll let you know as soon as your withdrawal has been processed',
          type: FontType.smallText,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
