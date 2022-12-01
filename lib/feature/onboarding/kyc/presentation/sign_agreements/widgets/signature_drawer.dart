import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../../../../../../core/presentation/custom_text.dart';
import '../../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../../../core/values/app_values.dart';

class SignatureDrawer extends StatelessWidget {
  final SignatureController signatureController;
  final VoidCallback onSubmit;
  final VoidCallback onReset;
  final String initialValue;

  const SignatureDrawer({
    Key? key,
    required this.onSubmit,
    required this.onReset,
    this.initialValue = '',
    required this.signatureController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            'Sign here:',
            padding: EdgeInsets.only(bottom: 12),
          ),
          ...initialValue.isEmpty ? _signatureDrawer : _signatureImage,
        ],
      ),
    );
  }

  List<Widget> get _signatureImage => [
        Center(
          child: Image.memory(base64Decode(initialValue),
              key: const Key('customer_signature_png'), height: 200),
        ),
        Center(
          child: CustomTextButton(
            key: const Key('clear_signature_button'),
            onTap: onReset,
            label: 'Reset Signature',
          ),
        )
      ];

  List<Widget> get _signatureDrawer => [
        Signature(
          controller: signatureController,
          height: 200,
          backgroundColor: Colors.grey[300]!,
        ),
        Row(
          children: [
            Expanded(
              child: Center(
                child: CustomTextButton(
                    key: const Key('accept_signature_button'),
                    label: 'Accept',
                    onTap: onSubmit),
              ),
            ),
            Expanded(
              child: Center(
                child: CustomTextButton(
                  key: const Key('reset_signature_button'),
                  label: 'Reset',
                  onTap: onReset,
                ),
              ),
            ),
          ],
        )
      ];
}
