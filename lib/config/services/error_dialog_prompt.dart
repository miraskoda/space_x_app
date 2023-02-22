import 'package:flutter/material.dart';
import 'package:space_x_app/ui/error/error_dialog.dart';

class ErrorDialogPrompt {
  static track(BuildContext context, Function()? refetch) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ErrorViewDialog(refetch);
        });
  }
}
