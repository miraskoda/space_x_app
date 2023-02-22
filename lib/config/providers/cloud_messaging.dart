import 'package:firebase_messaging/firebase_messaging.dart';

Future<NotificationSettings> requestFirebaseMessagingConfig() async {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  messaging.setAutoInitEnabled(true);
  return messaging.requestPermission(
    sound: true,
    alert: true,
    badge: true,
    carPlay: false,
    provisional: false,
    announcement: false,
    criticalAlert: false,
  );
}
