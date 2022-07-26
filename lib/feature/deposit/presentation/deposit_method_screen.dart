import 'package:flutter/material.dart';

import '../../../core/presentation/custom_text.dart';
import '../../../core/presentation/custom_text_button.dart';
import '../bloc/deposit_bloc.dart';
import 'widget/custom_deposit_widget.dart';

class DepositMethodScreen extends StatelessWidget {
  const DepositMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDepositWidget(
      backTo: DepositPages.welcome,
      children: [
        const CustomText(
          'Deposit Method',
          padding: EdgeInsets.only(top: 10, bottom: 40),
          type: FontType.h2,
        ),
        const CustomText(
          'Please select method of deposit',
          padding: EdgeInsets.only(top: 10, bottom: 50),
          type: FontType.h4,
        ),
        _wireTransferButton(),
        _fpsButton(),
        _whatIsFpsButton(),
      ],
    );
  }

  Widget _wireTransferButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: CustomTextButton(
          key: const Key('wire_transfer_button'),
          borderRadius: 5,
          buttonText: 'WIRE TRANSFER',
          onClick: () => ''),
    );
  }

  Widget _fpsButton() {
    return Padding(
      padding: EdgeInsets.zero,
      child: CustomTextButton(
          key: const Key('fps_button'),
          borderRadius: 5,
          buttonText: 'FPS',
          onClick: () => ''),
    );
  }

  Widget _whatIsFpsButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        key: const Key('what_is_fps_button'),
        child: const CustomText('What is FPS?'),
        onTap: () => '',
      ),
    );
  }
}
