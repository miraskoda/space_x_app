import 'dart:io';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:space_x_app/core/constants/constants.dart';

class RemoteConfigService {
  late final FirebaseRemoteConfig remoteConfig;
  String? currentAppVersion;
  String? currentAppBundleId;
  String? currentAppName;

  RemoteConfigService() {
    remoteConfig = FirebaseRemoteConfig.instance;
  }

  Future<void> initialize() async {
    _initDefaults();
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(seconds: 5),
    ));
    await remoteConfig.fetchAndActivate();
    await remoteConfig.ensureInitialized();
    await PackageInfo.fromPlatform().then((PackageInfo value) {
      currentAppBundleId = value.packageName;
      currentAppName = value.appName;
      if (kIsWeb) {
        currentAppVersion = value.version;
      } else {
        if (Platform.isAndroid) {
          currentAppVersion = value.version;
        } else {
          currentAppVersion = value.buildNumber;
        }
      }
    });
  }

  void _initDefaults() {
    remoteConfig.setDefaults(<String, dynamic>{
      kRemoteConfigVersionKey: '',
    });
  }

  bool getBool(String key) {
    return remoteConfig.getBool(key);
  }

  String getString(String key) {
    return remoteConfig.getString(key);
  }

  RemoteConfigValue getValue(String key) {
    return remoteConfig.getValue(key);
  }

  double getDouble(String key) {
    return remoteConfig.getDouble(key);
  }
}
