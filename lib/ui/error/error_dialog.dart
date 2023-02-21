import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/ui/uni_widgets/primary_button.dart';

class ErrorViewDialog extends StatelessWidget {
  final VoidCallback? refetch;
  final Color? color;
  const ErrorViewDialog(this.refetch, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Error occurred',
              style: context.theme.textTheme.headline5!,
              textAlign: TextAlign.center,
            ),
            const Gap(30),
            Text(
              'Please try again later',
              style: context.theme.textTheme.subtitle1!,
            ),
            const Gap(30),
            PrimaryButton(
              onPressed: refetch!,
              text: 'again',
            )
          ],
        ),
      ),
    );
  }
}
