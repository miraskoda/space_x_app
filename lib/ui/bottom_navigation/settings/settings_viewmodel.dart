import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/app/app.logger.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/main.dart';
import 'package:stacked/stacked.dart';
import 'package:logger/logger.dart';
import 'package:flutter_gen/gen_l10n/phrase_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsViewModel extends BaseViewModel {
  final Logger log = getLogger('SettingsViewModel');

  final SharedPreferences _sharedPreferences = inject<SharedPreferences>();
  bool notificationBool =
      inject<SharedPreferences>().getBool(kNotificationsAllowedKey) ?? false;
  bool faceIdBool = false;
  bool touchIdBool = false;

  SettingsViewModel();

  void initialise(BuildContext context) async {
    log.i('initialise');
    await _handleGetPermissionNotification();
  }

  Future<bool> listenPerm() async {
    if (!kIsWeb) {
      return await Permission.microphone.isGranted &&
              await Permission.camera.isGranted
          ? true
          : false;
    }
    return false;
  }

  Future<void> _handleGetPermissionNotification() async {
    bool currentNotificationBool;
    if (!kIsWeb) {
      currentNotificationBool = await Permission.notification.isGranted == true;
    } else {
      currentNotificationBool =
          inject<SharedPreferences>().getBool(kNotificationsAllowedKey) ??
              false;
    }
    if (!currentNotificationBool) {
      _sharedPreferences.setBool(kNotificationsAllowedKey, false);
    }
    notificationBool =
        _sharedPreferences.getBool(kNotificationsAllowedKey) ?? false;
    notifyListeners();
  }

  void handleSetPermissionNotification(bool val) async {
    await _sharedPreferences.setBool(kNotificationsAllowedKey, val);
    notifyListeners();
  }

  void handleSetAuth(bool val, BiometricType type) async {
    if (type == BiometricType.face) {
      faceIdBool = val;
      await _sharedPreferences.setBool(kAuthorizationFaceAllowedKey, val);
    } else if (type == BiometricType.fingerprint) {
      touchIdBool = val;
      await _sharedPreferences.setBool(kAuthorizationTouchAllowedKey, val);
    }
    notifyListeners();
  }

  void onLanguageChange(String? str, BuildContext context) async {
    if (str != null) {
      _sharedPreferences.setString(kCurrentLocale, str);
      Intl.systemLocale = str;
      AppLocalizations.delegate.load(Locale(str));
      PhraseLocalizations.delegate.load(Locale(str));
      Base.of(context)?.setLocale(Locale(str));
    } else {
      Fluttertoast.showToast(msg: 'failed to set language');
    }
  }

  String get currentLanguageString {
    String? str = _sharedPreferences.getString(
      kCurrentLocale,
    );
    int index = kAvailableLocales.indexOf(str ?? '');
    if (index > 0) {
      return kAvailableLocalesString[index];
    } else {
      return kAvailableLocalesString.first;
    }
  }
}
