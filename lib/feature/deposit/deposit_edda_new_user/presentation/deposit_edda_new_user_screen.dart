import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../bloc/deposit_bloc.dart';
import '../../presentation/widget/custom_deposit_widget.dart';

class DepositEddaNewUserScreen extends StatelessWidget {
  const DepositEddaNewUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
      backTo: DepositPageStep.depositMethod,
      children: [
        _text('eDDA Transfer', fontType: FontType.h2),
        _text(
            'eDDA allows you to make instant deposits to your brokerage accounts in just a few steps.'),
        _text('Please note that not all banks are currently supported',
            bottomPadding: 30),
        _text('Add a New Bank Account',
            bottomPadding: 4, fontType: FontType.smallTextBold),
        Center(
            child: InkWell(
          key: const Key('deposit_add_bank_details'),
          onTap: () => context
              .read<DepositBloc>()
              .add(const PageChanged(DepositPageStep.eddaYourBankDetails)),
          child: const Icon(
            Icons.add_circle_outline,
            size: 50,
          ),
        ))
      ],
    );
  }

  Widget _text(String text,
          {FontType fontType = FontType.smallText,
          double bottomPadding = 14}) =>
      CustomText(
        text,
        padding: EdgeInsets.only(top: 10, bottom: bottomPadding),
        type: fontType,
      );
}
