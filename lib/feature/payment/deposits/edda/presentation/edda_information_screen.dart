import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/deposit_bloc.dart';

class EddaInformationScreen extends StatelessWidget {
  const EddaInformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<DepositPageStep>(
      title: 'What is eDDA?',
      child: ListView(
        children: const [
          CustomText(
            key: Key('edda_information_screen_info_key'),
            '''eDDA is also a value-added service in the FPS to support the setting-up of an authorisation to debit the payer’s account by direct debit payments initiated by the payee participant through the FPS.\n\nThis function enables you to link your bank account to AskLORA for quick and easy deposits. Once the deposit instruction has been sent via eDDA, it takes just a couple of seconds for the deposit to go through, allowing for near instant funding to your brokerage account!\n\nDon’t worry, the eDDA service will never take money from your account without you specifically authorising the transaction.\n\nPlease note that not all banks are supported. We are constantly working to add more banks to our eDDA service. ''',
            padding: EdgeInsets.only(bottom: 20),
            type: FontType.bodyTextBold,
          ),
        ],
      ),
    );
  }
}
