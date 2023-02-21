import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SecondViewModel extends BaseViewModel {
  final NavigationService _navigationService = inject<NavigationService>();
  final RemoteConfigService remoteConfigService = inject<RemoteConfigService>();
  final SharedPreferences _sharedPreferences = inject<SharedPreferences>();

  void initialise(
    BuildContext context,
  ) {}
}
