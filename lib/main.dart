import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/utils/responsive_utils.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/app/app.router.dart';
import 'package:space_x_app/config/firebase/analytics_service.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/config/services/push_notification_service.dart';
import 'package:space_x_app/config/services/sentry.dart';
import 'package:space_x_app/config/theme/dark_theme.dart';
import 'package:space_x_app/config/theme/light_theme.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/init_app.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(() async {
    await loadMainAppRequirements();
    runApp(
      const Base(),
    );
  }, (exception, stackTrace) async {
    ExceptionTracker.track(exception, stackTrace);
  });
}

Future<void> loadMainAppRequirements() async {
  await setupSetry();
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    const firebaseConfig = FirebaseOptions(
        apiKey: "AIzaSyAois3mAmiemfTrDyNgd_fwmtLFxwbvQVQ",
        authDomain: "spacex-73edc.firebaseapp.com",
        projectId: "spacex-73edc",
        storageBucket: "spacex-73edc.appspot.com",
        messagingSenderId: "681517240136",
        appId: "1:681517240136:web:b3ad43ff8cc134a53e2d7d",
        measurementId: "G-68FG2D2EWY");
    await Firebase.initializeApp(options: firebaseConfig);
  } else {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    PushNotificationService.init();
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
  }
  await ThemeManager.initialise();
  await setupInjector(environment: Environment.dev);
}

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => BaseState();

  static BaseState? of(BuildContext context) =>
      context.findAncestorStateOfType<BaseState>();
}

class BaseState extends State<Base> with WidgetsBindingObserver {
  final _sentryRouteObserver = SentryNavigatorObserver();

  final AnalyticsService _analyticsService = inject<AnalyticsService>();
  final SharedPreferences _sharedPreferences = inject<SharedPreferences>();
  AppLifecycleState? appState;

  bool internetConnected = true;
  late Locale _locale;

  @override
  void initState() {
    super.initState();
    _locale =
        Locale(_sharedPreferences.getString(kCurrentLocale) ?? kDefaultLocale);
    appState = WidgetsBinding.instance.lifecycleState;
    WidgetsBinding.instance.addObserver(this);
  }

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
        darkTheme: darkTheme,
        lightTheme: lightTheme,
        defaultThemeMode: ThemeMode.system,
        builder: (BuildContext context, ThemeData? regularTheme,
            ThemeData? darkTheme, ThemeMode? themeMode) {
          return MaterialApp(
            locale: _locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('cs'),
            ],
            onGenerateTitle: (context) => "Space X app",
            showSemanticsDebugger: false,
            debugShowCheckedModeBanner: false,
            theme: regularTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            navigatorObservers: _analyticsService.analytics != null
                ? [
                    _sentryRouteObserver,
                    FirebaseAnalyticsObserver(
                        analytics: _analyticsService.analytics!)
                  ]
                : [_sentryRouteObserver],
            navigatorKey: StackedService.navigatorKey,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            builder: (BuildContext context, Widget? child) {
              return NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return false;
                },
                child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 1, alwaysUse24HourFormat: true),
                  child: ResponsiveWrapper.builder(
                    InitApp(child: child ?? const SizedBox.shrink()),
                    minWidth: kMinSupportedWidth,
                    maxWidth: kMaxSupportedWidth,
                    defaultScale: true,
                    minWidthLandscape: kMinSupportedWidth,
                    maxWidthLandscape: kMaxSupportedWidth,
                    defaultScaleLandscape: true,
                    landscapePlatforms: ResponsiveTargetPlatform.values,
                    breakpoints: const [
                      ResponsiveBreakpoint.resize(kMinSupportedWidth,
                          name: TABLET),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
