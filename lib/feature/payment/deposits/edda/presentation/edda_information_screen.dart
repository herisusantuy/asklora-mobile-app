import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../bloc/deposit_bloc.dart';
import '../../shareable/widget/custom_deposit_widget.dart';

class EddaInformationScreen extends StatelessWidget {
  const EddaInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomDepositWidget(
        backTo: DepositPageStep.depositMethod,
        children: [
          CustomText(
            'What is eDDA?',
            padding: EdgeInsets.only(bottom: 40),
            type: FontType.h2,
          ),
          CustomText(
            '''eDDA is also a value-added service in the FPS to
support the setting-up of an authorisation to debit the payer’s account by direct debit payments initiated by the payee participant through the FPS. 

This function enables you to link your bank account to AskLORA for quick and easy deposits. Once the deposit instruction has been sent via eDDA, it takes just a couple of seconds for the deposit to go through, allowing for near instant funding to your brokerage account! 

Don’t worry, the eDDA service will never take money from your account without you specifically authorising the transaction. 

Please note that not all banks are supported. We are constantly working to add more banks to our eDDA service. ''',
            padding: EdgeInsets.only(bottom: 20),
            type: FontType.bodyTextBold,
          ),
        ]);
  }
}
