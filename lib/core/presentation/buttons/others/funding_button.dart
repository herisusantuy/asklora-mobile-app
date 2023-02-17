import 'package:flutter/material.dart';

import '../../../styles/asklora_colors.dart';

enum FundingType { fund, withdraw }

class FundingButton extends StatelessWidget {
  final FundingType fundingType;
  final VoidCallback onTap;
  final bool disabled;

  FundingButton(
      {required this.fundingType,
      required this.onTap,
      this.disabled = false,
      Key? key})
      : super(key: key);

  final ButtonStyle _defaultButtonStyle = ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: const Size(55, 100),
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ));

  @override
  Widget build(BuildContext context) {
    final foregroundColor = disabled
        ? AskLoraColors.darkGray
        : fundingType == FundingType.fund
            ? AskLoraColors.primaryGreen
            : AskLoraColors.primaryMagenta;

    return SizedBox(
      height: 67,
      child: ElevatedButton(
          style: _getDefaultButtonStyle,
          onPressed: () {
            if (!disabled) {
              FocusManager.instance.primaryFocus?.unfocus();
              onTap();
            }
          },
          child: Row(
            children: [
              Icon(
                Icons.monetization_on_outlined,
                color: foregroundColor,
                size: 30,
              ),
              const SizedBox(
                width: 3,
              ),
              Icon(
                fundingType == FundingType.fund
                    ? Icons.arrow_downward_rounded
                    : Icons.arrow_upward_rounded,
                color: foregroundColor,
                size: 30,
              )
            ],
          )),
    );
  }

  ButtonStyle get _getDefaultButtonStyle {
    switch (fundingType) {
      case FundingType.fund:
        return _defaultButtonStyle.copyWith(
          backgroundColor: _getColor(
              disabled ? AskLoraColors.gray : AskLoraColors.charcoal,
              AskLoraColors.charcoal.withOpacity(0.9)),
        );
      case FundingType.withdraw:
        return _defaultButtonStyle.copyWith(
          backgroundColor: _getColor(
              disabled ? AskLoraColors.gray : AskLoraColors.charcoal,
              AskLoraColors.charcoal.withOpacity(0.9)),
        );
    }
  }

  MaterialStateProperty<Color> _getColor(Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    });
  }
}
