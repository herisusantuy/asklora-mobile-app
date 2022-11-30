import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../../../../../../core/presentation/custom_text.dart';
import '../../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../../../core/values/app_values.dart';

class SignatureDrawer extends StatelessWidget {
  final SignatureController _signatureController = SignatureController();
  final VoidCallback onSubmit;
  final VoidCallback onReset;
  final String? initialValue;
  SignatureDrawer({
    Key? key,
    required this.onSubmit,
    required this.onReset,
    this.initialValue,
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
          initialValue != null
              ? Column(
                  children: [
                    Signature(
                      controller: _signatureController,
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
                              onTap: () {
                                onSubmit();
                              },
                            ),
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
                  ],
                )
              : Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.memory(base64Decode(initialValue!),
                          key: const Key('customer_signature_png'),
                          height: 200),
                    ),
                    CustomTextButton(
                      key: const Key('clear_signature_button'),
                      onTap: () {
                        _signatureController.clear();
                        onReset();
                      },
                      label: 'Reset Signature',
                    )
                  ],
                ),
        ],
      ),
    );
  }

  Future<String?> _getCustomerSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.transparent,
      points: _signatureController.points,
    );
    final bytes = await exportController.toPngBytes();
    String? base64Image;
    if (bytes != null) {
      base64Image = base64Encode(bytes);
    }
    return base64Image;
  }
}
