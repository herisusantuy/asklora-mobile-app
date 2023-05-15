import 'package:flutter/material.dart';

import '../../../core/presentation/custom_text_new.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../deposit/utils/deposit_utils.dart';

class ChangeBankAccountButton extends StatelessWidget {
  const ChangeBankAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => DepositWelcomeScreen.open(
        context: context,
        depositType: DepositType.firstTime,
      ),
      child: CustomTextNew(
        'CHANGE BANK ACCOUNT',
        style: AskLoraTextStyles.subtitle2.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
