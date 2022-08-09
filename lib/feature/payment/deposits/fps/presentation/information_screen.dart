import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../bloc/deposit_bloc.dart';
import '../../shareable/widget/custom_deposit_widget.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
      backTo: DepositPageStep.depositMethod,
      child: Column(
        children: const [
          CustomText(
            'What is FPS?',
            padding: EdgeInsets.only(bottom: 40),
            type: FontType.h2,
          ),
          CustomText(
            'FPS is a payment service platform that allows customers to make instant domestic payments to individuals and merchants in Hong Kong dollar or Renminbi via our online and mobile banking. It will be available 24/7, free of charge and covering participating local banks and financial institutes with Stored Value Facility (SVF) licenses.',
            padding: EdgeInsets.only(bottom: 20),
            type: FontType.bodyTextBold,
          ),
          CustomText(
            'Traditional fund transfers require the payee’s bank account number, but FPS supports payments made using the payee’s mobile number, email address, FPS Identifier or HKID. FPS also allows registered payees to use a QR code to receive payments (a Mobile Security Key or Security Device might be required to complete the transaction). You can also receive payments and transfers from institutions, corporates and the HKSAR government via your Hong Kong ID number.',
            type: FontType.bodyTextBold,
          ),
        ],
      ),
    );
  }
}
