import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> setupSetry() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://c8187d19365e4088b8c2cc3a4ade5058@o4504716924026880.ingest.sentry.io/4504716924944384';
      options.tracesSampleRate = kDebugMode ? 0.01 : 1.0;
    },
  );
}
