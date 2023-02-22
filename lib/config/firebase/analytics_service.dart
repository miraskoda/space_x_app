import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/core/utils/tracking_events.dart';

class AnalyticsService {
  String? currentEnv = kDebugMode ? 'dev' : 'prod';
  String? currentLocalVersion;
  FirebaseAnalytics? analytics;

  Future<void> initialize() async {
    analytics = FirebaseAnalytics.instance;
    analytics?.logAppOpen();
    currentLocalVersion = (await PackageInfo.fromPlatform()).version;
  }

  void trackUserClick(String elementId) async {
    if (analytics != null) {
      await analytics!.logEvent(
        name: kAllUserClick,
        parameters: {
          "env": currentEnv,
          "element_id": elementId,
          "version": currentLocalVersion,
        },
      );
    }
  }

  void trackCustomEvent(String eventName, Map<String, String> params) async {
    if (analytics != null) {
      await analytics!.logEvent(
        name: eventName,
        parameters: {
          ...params,
          "env": currentEnv,
          "version": currentLocalVersion,
        },
      );
    }
  }

  void trackScreenTransition(String screenName) async {
    if (analytics != null) {
      await analytics!.setCurrentScreen(screenName: screenName);
    }
  }
}

void handleTrackedClick({String? elementId, String? copy}) {
  final analyticsService = inject<AnalyticsService>();
  if (elementId != null || copy != null) {
    analyticsService.trackUserClick(elementId ?? copy ?? '');
  }
}

void handleTrackCustomEvent(String eventName,
    {Map<String, String> params = const {}}) {
  final analyticsService = inject<AnalyticsService>();
  analyticsService.trackCustomEvent(eventName, params);
}
