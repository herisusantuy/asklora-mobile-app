import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';

class KycButtonPair extends StatelessWidget {
  final String primaryButtonLabel;
  final String secondaryButtonLabel;
  final bool disablePrimaryButton;
  final Function() primaryButtonOnClick;
  final Function() secondaryButtonOnClick;
  final EdgeInsets padding;

  const KycButtonPair(
      {required this.primaryButtonOnClick,
      required this.secondaryButtonOnClick,
      required this.primaryButtonLabel,
      required this.secondaryButtonLabel,
        this.disablePrimaryButton = false,
      this.padding = const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: padding,
      child: Column(
        children: [
          CustomButton(
            key: const Key('kyc_primary_button'),
            fontStyle: FontStyle.normal,
            disable: disablePrimaryButton,
            label: primaryButtonLabel,
            onClick: primaryButtonOnClick,
          ),
          CustomTextButton(
            key: const Key('kyc_secondary_button'),
            margin: const EdgeInsets.only(top: 24, bottom: 12),
            label: secondaryButtonLabel,
            onTap: secondaryButtonOnClick,
            fontType: FontType.smallTextBold,
          )
        ],
      ),
    );
  }
}
