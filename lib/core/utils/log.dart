import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class Logger {
  static log(dynamic message) {
    if (kDebugMode) {
      const prefix = 'Asklora debug :';
      debugPrint('$prefix $message');
    }
  }

  static sendSuccessLogsToSentry(
    String xRequestId,
    String message,
  ) async =>
      await Sentry.captureMessage(xRequestId,
          template: message, hint: Hint.withMap({'x-request-id': xRequestId}));

  static sendErrorLogsToSentry(String xRequestId, dynamic stackTrace) async =>
      await Sentry.captureException(
        xRequestId,
        stackTrace: stackTrace,
      );

  static sendEvent(String xRequestId, String logs, SentryLevel level) async {
    SentryEvent event = SentryEvent(
      tags: {'x-request-id': xRequestId, 'title': xRequestId},
      level: level,
    );
    await Sentry.captureEvent(event, stackTrace: logs);
  }
}
