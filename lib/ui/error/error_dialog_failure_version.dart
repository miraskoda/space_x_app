import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/config/theme/light_theme.dart';
import 'package:space_x_app/core/utils/url_lancher.dart';
import 'package:space_x_app/ui/uni_widgets/primary_button.dart';

class ErrorViewDialogFailureVersion extends StatelessWidget {
  const ErrorViewDialogFailureVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      backgroundColor: Colors.white,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'appUpdateRequired',
              style: context.theme.textTheme.bodyText2!,
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            Text(
              'oldAppVersionPleaseUpdate',
              style: context.theme.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const Gap(30),
            PrimaryButton(
                minWidth: 250,
                minHeight: 30,
                warningMode: false,
                onPressed: () async {
                  String? urlWeb = "https://www.spacex.com/";
                  try {
                    await UrlLauncher.launchURL(urlWeb);
                  } catch (e) {
                    ExceptionTracker.trackCatchError(e);
                    log(e.toString());
                    Fluttertoast.showToast(msg: 'error');
                  }
                },
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  SvgPicture.asset("assets/svg/refresh.svg",
                      color: context.theme.backgroundColor, width: 18),
                  const Gap(5),
                  Text('update'),
                ])),
          ],
        ),
      ),
    );
  }
}
