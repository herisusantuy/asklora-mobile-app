import 'package:flutter/material.dart';
import '../../../../../../core/presentation/custom_text_button.dart';

class UpgradeAccountButton extends StatelessWidget {
  final bool disable;
  final bool isLoading;
  final Function onClick;
  final String label;

  const UpgradeAccountButton(
      {this.disable = true,
      this.label = 'Next',
      required this.onClick,
      this.isLoading = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CustomTextButton(
          disable: disable,
          isLoading: isLoading,
          buttonText: label,
          borderRadius: 30,
          onClick: () {
            FocusManager.instance.primaryFocus?.unfocus();
            onClick();
          }),
    );
  }
}
