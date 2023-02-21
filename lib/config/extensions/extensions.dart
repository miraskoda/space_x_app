import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this)!;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
}

extension FutureExtension on Future {
  bool isCompleted() {
    final completer = Completer();
    then(completer.complete).catchError(completer.completeError);
    return completer.isCompleted;
  }
}
