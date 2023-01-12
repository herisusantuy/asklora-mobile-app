import 'dart:ui';

import 'package:flutter/material.dart';

import '../custom_overlay_widget.dart';
import 'jumping_dots_widget.dart';

class CustomLoadingOverlay {
  static void show(BuildContext context) {
    CustomOverlayWidget.show(
      context,
      Material(
        color: Colors.white70,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: JumpingDotsWidget(
            color: Colors.yellow,
            radius: 30,
            numberOfDots: 3,
            animationDuration: const Duration(milliseconds: 300),
          ),
        ),
      ),
    );
  }

  static void dismiss() {
    CustomOverlayWidget.dismiss();
  }
}
