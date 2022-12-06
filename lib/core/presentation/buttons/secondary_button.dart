import 'package:flutter/material.dart';
import '../../domain/pair.dart';
import '../../styles/asklora_colors.dart';

enum ButtonSecondarySize { small, big }

class SecondaryButton extends StatelessWidget {
  final String label;
  final ButtonSecondarySize buttonSecondarySize;
  final FontStyle fontStyle;
  final VoidCallback onTap;
  final bool active;

  SecondaryButton(
      {this.label = '',
      required this.onTap,
      this.fontStyle = FontStyle.normal,
      this.buttonSecondarySize = ButtonSecondarySize.big,
      this.active = false,
      Key? key})
      : super(key: key);

  final ButtonStyle _defaultButtonStyle = ElevatedButton.styleFrom(
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _getSizedBoxSize.left,
      child: ElevatedButton(
          style: _defaultButtonStyle.copyWith(
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(Colors.transparent,
                  AskLoraColors.primaryGreen.withOpacity(0.2)),
              foregroundColor: _getColor(AskLoraColors.charcoal,
                  AskLoraColors.charcoal.withOpacity(0.9)),
              shape: _getBorder(
                  active ? AskLoraColors.primaryGreen : AskLoraColors.gray,
                  AskLoraColors.gray.withOpacity(0.9))),
          onPressed: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(label,
                  style: TextStyle(
                      fontSize: _getFontSize,
                      fontStyle: fontStyle,
                      fontWeight: FontWeight.w700)),
            ),
          )),
    );
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
              width: 1.4,
              color: states.contains(MaterialState.pressed)
                  ? colorPressed
                  : color));
    });
  }

  MaterialStateProperty<Size?> get _getButtonMinimumSize {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      switch (buttonSecondarySize) {
        case ButtonSecondarySize.small:
          return const Size(200, 40);
        case ButtonSecondarySize.big:
          return const Size(double.infinity, 50);
      }
    });
  }

  Pair<double, double> get _getSizedBoxSize {
    switch (buttonSecondarySize) {
      case ButtonSecondarySize.small:
        return Pair(200, 40);
      case ButtonSecondarySize.big:
        return Pair(double.infinity, 50);
    }
  }

  double get _getFontSize {
    switch (buttonSecondarySize) {
      case ButtonSecondarySize.small:
        return 10;
      case ButtonSecondarySize.big:
        return 14;
    }
  }
}
