import 'dart:ui';

import 'package:flutter/material.dart';

import 'jumping_dots_widget.dart';

class CustomLoadingOverlay {
  static bool _isShowing = false;

  void dismiss(BuildContext context) {
    if (_isShowing) {
      _isShowing = !_isShowing;
      Navigator.of(context).pop();
    }
  }

  void show(BuildContext context) {
    _isShowing = !_isShowing;
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        useSafeArea: false,
        barrierDismissible: false,
        builder: (ctx) => WillPopScope(
              onWillPop: () async => false,
              child: Material(
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
            ));
  }

  Future<T> during<T>(Future<T> future, BuildContext context) {
    show(context);
    return future.whenComplete(() => dismiss(context));
  }

  static final CustomLoadingOverlay _singleton = CustomLoadingOverlay._create();

  factory CustomLoadingOverlay() => _singleton;

  CustomLoadingOverlay._create();

  static CustomLoadingOverlay get instance => _singleton;

  factory CustomLoadingOverlay.of() {
    return CustomLoadingOverlay._create();
  }
}
