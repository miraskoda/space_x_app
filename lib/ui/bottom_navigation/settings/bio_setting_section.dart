import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/config/theme/light_theme.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/core/managers/data_holder.dart';
import 'package:space_x_app/core/resources/authentication.dart';
import 'package:space_x_app/ui/bottom_navigation/settings/settings_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/set_pin_code/set_pin_code_view.dart';
import 'package:space_x_app/ui/uni_widgets/settings_value_switch.dart';
import 'package:space_x_app/ui/uni_widgets/shimmer.dart';

class BioSettingSection extends StatefulWidget {
  SettingsViewModel viewModel;

  BioSettingSection(this.viewModel, {Key? key}) : super(key: key);

  @override
  State<BioSettingSection> createState() => _BioSettingSectionState();
}

class _BioSettingSectionState extends State<BioSettingSection> {
  final LocalAuthentication _localAuth = LocalAuthentication();
  final SharedPreferences _sharedPreferences = inject<SharedPreferences>();
  final DataHolder _dataHolder = inject<DataHolder>();

  Future<void> handleBioSettingsChange(
      BuildContext context, BiometricType biometricType, bool value) async {
    if (value) {
      try {
        final bool didAuthenticate = await _localAuth.authenticate(
            localizedReason: 'authPromptLocalized',
            authMessages: [
              createIosAuthMessages(context),
              createAndroidAuthMessages(context),
            ]);
        if (didAuthenticate) {
          widget.viewModel.handleSetAuth(didAuthenticate, biometricType);
        }
      } catch (e) {
        ExceptionTracker.trackCatchError(e);
        log(e.toString());
      }
    } else {
      widget.viewModel.handleSetAuth(false, biometricType);
    }
  }

  Future<void> handleSetPin() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: math.max(
                    10, ((MediaQuery.of(context).size.width) - 500) / 2)),
            child: Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: SizedBox(
                  height: 350,
                  child: PinCodeView(
                    onlyPresenting: true,
                    onPressed: (String value) async {
                      try {
                        if (value.length != 4) {
                          Fluttertoast.showToast(msg: 'notProperLetterAmount');
                          return;
                        }
                        _sharedPreferences.setBool(
                            kNullBiometricAvailable, true);
                        _sharedPreferences.setString(kUserPinCode, value);
                        Fluttertoast.showToast(msg: 'success');

                        Navigator.pop(context);
                        setState(() {});
                      } catch (e) {
                        log(e.toString());
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    List<BiometricType>? bioType = _dataHolder.biometricsAvailable;
    return Builder(builder: (BuildContext context) {
      if (bioType != null) {
        if (bioType?.contains(BiometricType.face) == true) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              Text(
                'safety'.toUpperCase(),
                style: context.theme.textTheme.bodyText2!,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(builder: (context) {
                    return SettingsValueSwitch(
                        value: widget.viewModel.faceIdBool,
                        label: 'loginWithFaceID',
                        onChanged: (bool value) => handleBioSettingsChange(
                            context, BiometricType.face, value));
                  }),
                  const Gap(16),
                ],
              ),
            ],
          );
        } else if (bioType?.contains(BiometricType.fingerprint) == true) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              Text(
                'safety'.toUpperCase(),
                style: context.theme.textTheme.bodyText2!,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(builder: (context) {
                    return SettingsValueSwitch(
                        value: widget.viewModel.touchIdBool,
                        label: 'loginWithTouchID',
                        onChanged: (bool value) => handleBioSettingsChange(
                            context, BiometricType.fingerprint, value));
                  }),
                  const Gap(16),
                ],
              ),
            ],
          );
        } else {
          return _sharedPreferences.getString(kUserPinCode) == null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(16),
                    Text(
                      'safety'.toUpperCase(),
                      style: context.theme.textTheme.bodyText2!,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(builder: (context) {
                          return SettingsValueSwitch(
                              butonActionDisabled:
                                  _sharedPreferences.getString(kUserPinCode) !=
                                      null,
                              buttonAction: true,
                              value: false,
                              label: 'setPINCode',
                              onChanged: (bool value) =>
                                  _sharedPreferences.getString(kUserPinCode) !=
                                          null
                                      ? null
                                      : handleSetPin());
                        }),
                        const Gap(16),
                      ],
                    ),
                  ],
                )
              : const SizedBox.shrink();
        }
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
