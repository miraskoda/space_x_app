import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/app/app.router.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/ui/error/error_dialog_failure_version.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:version/version.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = inject<NavigationService>();
  final _sharedPreferences = inject<SharedPreferences>();

  final RemoteConfigService _remoteConfigService =
      inject<RemoteConfigService>();

  String? appVersion;

  SplashViewModel();

  void init(BuildContext context) async {
    Future.delayed(const Duration(seconds: 1), () {
      Future.doWhile(() async {
        await Future.delayed(const Duration(seconds: 1));
        appVersion = _remoteConfigService.getString(kRemoteConfigVersionKey);
        if (appVersion != null &&
            _remoteConfigService.currentAppVersion != null) {
          if (Version.parse(appVersion!) >
              Version.parse(_remoteConfigService.currentAppVersion!)) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return const ErrorViewDialogFailureVersion();
                });
          } else {
            navigateFurther(Routes.bottomNavigation);
          }

          return false;
        }
        return true;
      });
    });
  }

  void navigateFurther(String? route) {
    if (route == null) {
      Future.delayed(Duration.zero, () {
        _navigationService.replaceWith(Routes.bottomNavigation);
      });
    } else {
      Future.delayed(Duration.zero, () {
        _navigationService.replaceWith(route);
      });
    }
  }
}
