import 'package:flutter/material.dart';

import '../../../core/presentation/custom_text.dart';
import '../../../core/presentation/custom_text_button.dart';
import 'what_is_fps_screen.dart';

class DepositMethodScreen extends StatelessWidget {
  const DepositMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _wireTransferButton(),
                    _fpsButton(),
                    _whatIsFpsButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

  Widget _whatIsFpsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        key: const Key('what_is_fps_button'),
        child: const CustomText('What is FPS?'),
        onTap: () => WhatIsFpsScreen.open(context),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const DepositMethodScreen()));
}
