import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import '../../../../../../core/presentation/custom_text_button.dart';

class SignatureDrawer extends StatelessWidget {
  final SignatureController signatureController;
  final void Function() onSubmit;
  final void Function() onReset;
  const SignatureDrawer({
    Key? key,
    required this.signatureController,
    required this.onSubmit,
    required this.onReset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Signature(
            controller: signatureController,
            height: 200,
            backgroundColor: Colors.grey[300]!,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextButton(
                key: const Key('accept_signature_button'),
                buttonText: 'Accept',
                onClick: onSubmit,
              ),
            ),
            Expanded(
              child: CustomTextButton(
                key: const Key('reset_signature_button'),
                buttonText: 'Reset',
                onClick: onReset,
              ),
            ),
          ],
        )
      ],
    );
  }
}
