import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/app/app.logger.dart';
import 'package:space_x_app/app/app.router.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetPinCodeViewModel extends BaseViewModel {
  final Logger log = getLogger('SetPinCodeViewModel');
  final _navigationService = inject<NavigationService>();
  final SharedPreferences _sharedPreferences = inject<SharedPreferences>();
  late BuildContext context;

  String value = '';

  void setValue(String value) {
    this.value = value;
    notifyListeners();
  }

  void tapToContinue() {
    if (value.length != 4) {
      Fluttertoast.showToast(msg: 'notProperLetterAmount');
      return;
    }
    _sharedPreferences.setBool(kNullBiometricAvailable, true);
    _sharedPreferences.setString(kUserPinCode, value);
    _navigationService.pushNamedAndRemoveUntil(Routes.bottomNavigation,
        predicate: (Route<dynamic> route) => false);
  }

  init(BuildContext context) {
    this.context = context;
  }
}
