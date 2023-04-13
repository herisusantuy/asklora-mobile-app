import 'package:flutter/material.dart';

import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/round_colored_box.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../generated/l10n.dart';

class PaymentDetailScreen extends StatelessWidget {
  static const route = '/payment_details';
  const PaymentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomStretchedLayout(
          header: CustomHeader(title: S.of(context).paymentDetails),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextNew(S.of(context).yourBankAccount,
                  style: AskLoraTextStyles.body1),
              CustomTextNew(
                  S.of(context).yourBankAccountIsUnderReview('2023/3/23'),
                  style: AskLoraTextStyles.body1),
              const SizedBox(height: 32),
              _bankDetails,
              const SizedBox(height: 32),
              _changeBankButton,
              const SizedBox(height: 32),
              CustomTextNew(S.of(context).noteOnPaymentDetails,
                  style: AskLoraTextStyles.body3)
            ],
          )),
    );
  }

  Widget get _bankDetails {
    return RoundColoredBox(
        content: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextNew('Hang Seng Bank Limited',
              style:
                  AskLoraTextStyles.h6.copyWith(color: AskLoraColors.darkGray)),
          CustomTextNew('123 - 12356789 - 07', style: AskLoraTextStyles.body1),
          const SizedBox(height: 20),
          CustomTextNew('Lilian Lambert', style: AskLoraTextStyles.body1),
        ],
      ),
    ));
  }

  Widget get _changeBankButton {
    return Builder(builder: (context) {
      return GestureDetector(
        child: UnconstrainedBox(
          child: Container(
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(width: .5))),
            child: CustomTextNew(S.of(context).changeBankAccount,
                style: AskLoraTextStyles.h6),
          ),
        ),
      );
    });
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
