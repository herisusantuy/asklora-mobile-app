import 'package:flutter/material.dart';

import '../../domain/pair.dart';
import '../../styles/asklora_colors.dart';
import '../../styles/asklora_text_styles.dart';
import '../custom_text_new.dart';

enum ButtonPrimaryType { solidCharcoal, solidGreen, ghostCharcoal, ghostGreen }

enum ButtonPrimarySize { small, mid, big }

class PrimaryButton extends StatelessWidget {
  final String label;
  final bool disabled;
  final ButtonPrimaryType buttonPrimaryType;
  final ButtonPrimarySize buttonPrimarySize;
  final FontStyle fontStyle;
  final VoidCallback onTap;

  PrimaryButton(
      {this.label = '',
      this.buttonPrimaryType = ButtonPrimaryType.solidCharcoal,
      this.disabled = false,
      required this.onTap,
      this.fontStyle = FontStyle.italic,
      this.buttonPrimarySize = ButtonPrimarySize.big,
      Key? key})
      : super(key: key);

  final ButtonStyle _defaultButtonStyle = ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: const Size(55, 100),
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _getSizedBoxSize.right,
      child: ElevatedButton(
          style: _getDefaultButtonStyle,
          onPressed: disabled ? null : onTap,
          child: CustomTextNew(
            label,
            style: AskLoraTextStyles.button1,
          )),
    );
  }

  ButtonStyle get _getDefaultButtonStyle {
    switch (buttonPrimaryType) {
      case ButtonPrimaryType.solidCharcoal:
        return _defaultButtonStyle.copyWith(
            minimumSize: _getButtonMinimumSize,
            backgroundColor: _getColor(
                disabled ? AskLoraColors.gray : AskLoraColors.charcoal,
                AskLoraColors.charcoal.withOpacity(0.9)),
            foregroundColor: _getColor(
                disabled ? AskLoraColors.darkGray : AskLoraColors.primaryGreen,
                AskLoraColors.primaryGreen.withOpacity(0.9)));
      case ButtonPrimaryType.solidGreen:
        return _defaultButtonStyle.copyWith(
            minimumSize: _getButtonMinimumSize,
            backgroundColor: _getColor(
                disabled ? AskLoraColors.lightGray : AskLoraColors.primaryGreen,
                AskLoraColors.primaryGreen.withOpacity(0.9)),
            foregroundColor: _getColor(
                disabled ? AskLoraColors.darkGray : AskLoraColors.charcoal,
                AskLoraColors.charcoal.withOpacity(0.9)));
      case ButtonPrimaryType.ghostCharcoal:
        return _defaultButtonStyle.copyWith(
            minimumSize: _getButtonMinimumSize,
            backgroundColor: _getColor(
                Colors.white, AskLoraColors.primaryGreen.withOpacity(0.2)),
            foregroundColor: _getColor(
                disabled ? AskLoraColors.gray : AskLoraColors.charcoal,
                AskLoraColors.charcoal.withOpacity(0.9)),
            shape: _getBorder(
                disabled ? AskLoraColors.gray : AskLoraColors.charcoal,
                AskLoraColors.charcoal.withOpacity(0.9)));
      case ButtonPrimaryType.ghostGreen:
        return _defaultButtonStyle.copyWith(
            minimumSize: _getButtonMinimumSize,
            backgroundColor: _getColor(Colors.transparent,
                AskLoraColors.primaryGreen.withOpacity(0.2)),
            foregroundColor: _getColor(
                disabled ? AskLoraColors.gray : AskLoraColors.primaryGreen,
                AskLoraColors.primaryGreen.withOpacity(0.9)),
            shape: _getBorder(
                disabled ? AskLoraColors.gray : AskLoraColors.primaryGreen,
                AskLoraColors.primaryGreen.withOpacity(0.9)));
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

  MaterialStateProperty<OutlinedBorder> _getBorder(
      Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
              color: states.contains(MaterialState.pressed)
                  ? colorPressed
                  : color));
    });
  }

  MaterialStateProperty<Size?> get _getButtonMinimumSize {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      switch (buttonPrimarySize) {
        case ButtonPrimarySize.small:
          return const Size.fromWidth(60);
        case ButtonPrimarySize.mid:
          return const Size.fromWidth(200);
        case ButtonPrimarySize.big:
          return const Size.fromWidth(double.infinity);
      }
    });
  }

  Pair<double, double> get _getSizedBoxSize {
    switch (buttonPrimarySize) {
      case ButtonPrimarySize.small:
        return Pair(60, 20);
      case ButtonPrimarySize.mid:
        return Pair(200, 40);
      case ButtonPrimarySize.big:
        return Pair(double.infinity, 55);
    }
  }
}
