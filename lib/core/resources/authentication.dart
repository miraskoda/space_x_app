import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:local_auth_platform_interface/types/auth_messages.dart';
import 'package:local_auth_android/types/auth_messages_android.dart';
import 'package:local_auth_ios/types/auth_messages_ios.dart';
import 'package:space_x_app/config/extensions/extensions.dart';

AuthMessages createAndroidAuthMessages(BuildContext context) =>
    const AndroidAuthMessages(
        biometricHint: "",
        signInTitle: 'signIn',
        biometricSuccess: 'success',
        biometricNotRecognized: 'notRecognized',
        deviceCredentialsRequiredTitle: 'credentialsRequired',
        deviceCredentialsSetupDescription: 'credentialsSetup',
        biometricRequiredTitle: 'biometricRequired',
        goToSettingsButton: 'goToSettings',
        goToSettingsDescription: 'goToSettings',
        cancelButton: 'cancelButton');

AuthMessages createIosAuthMessages(BuildContext context) =>
    const IOSAuthMessages(
        lockOut: 'lockOut',
        goToSettingsButton: 'goToSettings',
        goToSettingsDescription: 'goToSettings',
        cancelButton: 'cancelButton');
