import 'package:flutter/foundation.dart';

class Logger {
  static log(String message) {
    if (kDebugMode) {
      const prefix = 'Asklora debug :';
      debugPrint('$prefix $message');
    }
  }
}
