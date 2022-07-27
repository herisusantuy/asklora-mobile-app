import 'package:flutter/material.dart';

import '../../../core/presentation/custom_text.dart';
import '../bloc/deposit_bloc.dart';
import 'widget/custom_card_copy_text.dart';
import 'widget/custom_deposit_widget.dart';
import 'widget/custom_row_text.dart';
import 'widget/deposit_next_button.dart';

class FpsTransferScreen extends StatelessWidget {
  const FpsTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _fpsId = '123456789';
    return CustomDepositWidget(
      backTo: DepositPages.depositMethod,
      navigationButton: const DepositNextButton(
        label: 'Upload Proof of Remittance',
        nextTo: DepositPages.depositMethod,
        disable: false,
      ),
      children: [
        const CustomText(
          'FPS Transfer',
          padding: EdgeInsets.only(bottom: 20),
          type: FontType.h2,
        ),
        const CustomText(
          'Please transfer to AskLORA’s bank account using your bank app',
        ),
        CustomCardCopyText(
          key: const Key('fps_id_card'),
          keyCopyButton: const Key('fps_id_card_copy_button'),
          label: 'FPS ID',
          text: _fpsId,
          message: '$_fpsId Copied',
          padding: const EdgeInsets.symmetric(vertical: 50),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        _notesText(),
      ],
    );
  }

  Widget _notesText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CustomText('Notes:', padding: EdgeInsets.only(bottom: 5)),
        CustomRowText(
            padding: EdgeInsets.only(bottom: 5),
            index: '1',
            text:
                'Please make sure that the name under your FPS account matches with the name that you used to sign up'),
        CustomRowText(
            padding: EdgeInsets.only(bottom: 5),
            index: '2',
            text:
                'Please make sure your FPS number matches the phone number you used to register on AskLORA'),
        CustomRowText(
            padding: EdgeInsets.only(bottom: 5),
            index: '3',
            text:
                'Did you know that in a year, cows kill more people than sharks?'),
      ],
    );
  }
}
