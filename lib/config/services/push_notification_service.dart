import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/core/utils/app_notification_utility.dart';

class PushNotificationService {
  final _messaging = FirebaseMessaging.instance;

  PushNotificationService.init() {
    if (kIsWeb) {
      // ExceptionTracker.trackCatchError('notification not supported');
      return;
    }
    try {
      FirebaseMessaging.onMessageOpenedApp
          .listen(NotificationUtility.onMessage);
      FirebaseMessaging.onMessage.listen(NotificationUtility.onMessage);

      _messaging.getInitialMessage().then(NotificationUtility.onMessage);
      _messaging.setAutoInitEnabled(true);
      _messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
      );

      _messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    } catch (e) {
      ExceptionTracker.trackCatchError(e);
    }
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  NotificationUtility.onMessage(message);
}
