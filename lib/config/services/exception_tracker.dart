import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ExceptionTracker {
  static track(exception, stackTrace) async {
    if (!kIsWeb) {
      FirebaseCrashlytics.instance
          .recordError(exception, stackTrace, fatal: true);
    }
    await Sentry.captureException(exception, stackTrace: stackTrace);
  }

  static trackCatchError(Object exception) async {
    try {
      if (!kIsWeb) {
        FirebaseCrashlytics.instance.log(exception.toString());
      }
      await Sentry.captureException(exception);
    } catch (_) {}
  }
}
