import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_themes/stacked_themes.dart';

typedef Callback = void Function(MethodCall call);

void setupFirebaseAuthMocks([Callback? customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  setupFirebaseCoreMocks();
}

Future<void> setupAllMocks() async {
//firebase initialization mock
  setupFirebaseAuthMocks();
  setUpAll(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://b57b44425700434a9491042778d8d98c@o1180070.ingest.sentry.io/4504120218288128';
        options.tracesSampleRate = kDebugMode ? 0.01 : 1.0;
      },
    );
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    SharedPreferences.setMockInitialValues({});
    await ThemeManager.initialise();
    await setupInjector(environment: Environment.dev);
  });
}
