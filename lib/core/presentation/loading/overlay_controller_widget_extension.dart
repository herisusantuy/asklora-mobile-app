import 'package:flutter/material.dart';

import 'overlay_controller_widget.dart';

extension OverlayControllerWidgetExtension on BuildContext {

  _OverlayExtensionHelper get loaderOverlay =>
      _OverlayExtensionHelper(OverlayControllerWidget.of(this));
}

class _OverlayExtensionHelper {
  static final _OverlayExtensionHelper _singleton =
      _OverlayExtensionHelper._internal();
  late OverlayControllerWidget _overlayController;

  bool? _visible;

  OverlayControllerWidget get overlayController => _overlayController;

  bool get visible => _visible ?? false;

  factory _OverlayExtensionHelper(OverlayControllerWidget? overlayController) {
    if (overlayController != null) {
      _singleton._overlayController = overlayController;
    }

    return _singleton;
  }

  _OverlayExtensionHelper._internal();

  void show({Widget? widget}) {
    _visible = true;
    _overlayController.setOverlayVisible(_visible!);
  }

  void hide() {
    _visible = false;
    _overlayController.setOverlayVisible(_visible!);
  }
}
