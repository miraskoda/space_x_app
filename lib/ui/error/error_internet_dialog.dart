import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/ui/uni_widgets/primary_button.dart';

class ErrorInternetViewDialog extends StatelessWidget {
  final VoidCallback? refetch;
  final VoidCallback? logout;

  const ErrorInternetViewDialog(this.refetch, this.logout, {Key? key})
      : super(key: key);

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
              'internetConnectionNotAvailable',
              style: context.theme.textTheme.bodyText2!,
              textAlign: TextAlign.center,
            ),
            const Gap(20),
            Text(
              'pleaseConnectToInternet',
              style: context.theme.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.w400, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const Gap(30),
            PrimaryButton(
              minWidth: 250,
              minHeight: 30,
              warningMode: false,
              onPressed: refetch!,
              text: 'tryReconnectingButton',
            ),
          ],
        ),
      ),
    );
  }
}
