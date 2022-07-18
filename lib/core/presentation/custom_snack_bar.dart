import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSnackBar {
  final BuildContext context;

  CustomSnackBar(this.context);

  late String _message = '';
  CustomSnackBarType _type = CustomSnackBarType.success;

  CustomSnackBar setMessage(String message) {
    _message = message;
    return this;
  }

  CustomSnackBar setType(CustomSnackBarType type) {
    _type = type;
    return this;
  }

  void show() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        backgroundColor:
            _type == CustomSnackBarType.success ? Colors.green : Colors.red,
        content: CustomText(_message),
      ));
  }
}

enum CustomSnackBarType { error, success }
