import 'dart:async';

import 'package:flutter/cupertino.dart';

class OverlayControllerWidget extends InheritedWidget {
  OverlayControllerWidget({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static OverlayControllerWidget? of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<OverlayControllerWidget>();

  final StreamController<Map<String, dynamic>> visibilityController =
      StreamController();

  Stream<Map<String, dynamic>> get visibilityStream =>
      visibilityController.stream;

  void setOverlayVisible(
    bool loading, {
    Widget? widget,
  }) =>
      visibilityController.add(<String, dynamic>{
        'loading': loading,
        'widget': widget,
      });

  void dispose() => visibilityController.close();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}
