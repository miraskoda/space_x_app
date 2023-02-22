import 'dart:async';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/app/app.logger.dart';
import 'package:space_x_app/app/app.router.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/core/utils/biometric_auth.dart';
import 'package:space_x_app/ui/error/error_dialog_failure_version.dart';
import 'package:space_x_app/ui/uni_widgets/set_pin_code/set_pin_code_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:version/version.dart';

class SplashViewModel extends BaseViewModel {
  final Logger log = getLogger('LoginFormViewModel');

  final _navigationService = inject<NavigationService>();
  final _sharedPreferences = inject<SharedPreferences>();

  bool? activatedFaceId;
  bool? activatedTouchId;
  bool? filedUserPin;

  final RemoteConfigService _remoteConfigService =
      inject<RemoteConfigService>();

  String? appVersion;

  SplashViewModel();

  void init(BuildContext context) async {
    // face id auth
    activatedFaceId = _sharedPreferences.getBool(kAuthorizationFaceAllowedKey);
    // touch auth
    activatedTouchId =
        _sharedPreferences.getBool(kAuthorizationTouchAllowedKey);
    filedUserPin =
        _sharedPreferences.getString(kUserPinCode)?.isNotEmpty == true;
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
            _authenticating(context);
          }

          return false;
        }
        return true;
      });
    });
  }

  void _navigateFurther() {
    _navigationService.replaceWith(Routes.bottomNavigation);
  }

  Future<void> _authenticating(BuildContext context) async {
    if ((activatedFaceId == true || activatedTouchId == true)) {
      Future.delayed(const Duration(milliseconds: 100), (() async {
        setBusy(true);
        bool authenticated =
            await BiometricAuthorization().getAuthenticated(context);
        if (authenticated) {
          Future.delayed(const Duration(milliseconds: 500), () async {
            try {
              _navigateFurther();
            } on DioError catch (e) {
              log.i(e);
            } catch (e) {
              ExceptionTracker.trackCatchError(e);
              log.i(e.toString());
            }
          });
          // setBusy(false);
        } else {
          setBusy(false);
          log.i("Authenticated error");
        }
      }));
    } else if (filedUserPin == true) {
      Future.delayed(const Duration(milliseconds: 100), () async {
        FocusNode focusNode = FocusNode();
        TextEditingController textEditingController = TextEditingController();
        await showDialog(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: max(
                        10, ((MediaQuery.of(context).size.width) - 500) / 2)),
                child: Center(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      height: 350,
                      child: PinCodeView(
                        validator: (String? value) {
                          if (value?.length == 4) {
                            String savedVal =
                                _sharedPreferences.getString(kUserPinCode) ??
                                    '';
                            if (savedVal == value) {
                            } else {
                              return 'passWontMatch';
                            }
                          }
                        },
                        textEditingController: textEditingController,
                        focusNode: focusNode,
                        onlyPresenting: true,
                        onPressed: (String value) async {
                          String savedVal =
                              _sharedPreferences.getString(kUserPinCode) ?? '';
                          if (savedVal == value) {
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            _navigateFurther();
                          } else {
                            Fluttertoast.showToast(msg: 'passWontMatch');

                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            textEditingController.clear();
                            focusNode.requestFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              );
            });
      });
    } else {
      _navigateFurther();
    }
  }
}
