import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:space_x_app/core/resources/authentication.dart';

class BiometricAuthorization {
  final LocalAuthentication localAuth = LocalAuthentication();
  Future<bool> getAuthenticated(BuildContext context) async {
    final bool didAuthenticate = await localAuth
        .authenticate(localizedReason: 'authPromptLocalized', authMessages: [
      createIosAuthMessages(context),
      createAndroidAuthMessages(context),
    ]);
    if (didAuthenticate) {
      return true;
    } else {
      return false;
    }
  }
}
