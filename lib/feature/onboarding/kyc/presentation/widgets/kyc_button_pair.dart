import 'package:flutter/material.dart';

import '../../../../../core/presentation/buttons/primary_button.dart';
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
      this.padding = EdgeInsets.zero,
      Key? key = const Key('kyc_button_pair')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          key: const Key('kyc_primary_button'),
          disabled: disablePrimaryButton,
          label: primaryButtonLabel,
          onTap: primaryButtonOnClick,
        ),
        CustomTextButton(
          key: const Key('kyc_secondary_button'),
          margin: const EdgeInsets.only(top: 27, bottom: 35),
          label: secondaryButtonLabel,
          onTap: secondaryButtonOnClick,
        )
      ],
    );
  }
}
