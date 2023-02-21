import 'package:space_x_app/config/firebase/analytics_service.dart';
import 'package:space_x_app/config/firebase/crashlytics_service.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';

Future<void> initializeFirebase(
    CrashlyticsService crashlyticsService,
    RemoteConfigService remoteConfigService,
    AnalyticsService analyticsService) async {
  await analyticsService.initialize();
  await crashlyticsService.initialize();
  await remoteConfigService.initialize();
  return Future.value();
}
