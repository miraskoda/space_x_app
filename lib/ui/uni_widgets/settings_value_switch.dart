import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/config/theme/light_theme.dart';
import 'package:space_x_app/ui/uni_widgets/primary_button.dart';

class SettingsValueSwitch extends StatelessWidget {
  final bool value;
  final String label;
  final Widget? child;
  final bool buttonAction;
  final bool butonActionDisabled;

  final VoidCallback? onTitleClick;
  final Function(bool) onChanged;

  const SettingsValueSwitch({
    Key? key,
    required this.value,
    required this.label,
    required this.onChanged,
    this.onTitleClick,
    this.butonActionDisabled = false,
    this.child,
    this.buttonAction = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: child ??
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onTitleClick?.call(),
                child: Text(label,
                    style: context.theme.textTheme.bodyText2!.copyWith(
                        fontSize: 15,
                        decoration: onTitleClick != null
                            ? TextDecoration.underline
                            : null,
                        fontWeight: FontWeight.w400)),
              ),
        ),
        const Gap(4),
        buttonAction
            ? SizedBox(
                height: 39,
                child: PrimaryButton(
                  disabledMode: butonActionDisabled,
                  minWidth: 50,
                  onPressed: () => onChanged(true),
                  text: butonActionDisabled ? 'locked' : 'setPassword',
                ),
              )
            : CupertinoSwitch(
                activeColor: spacePrimary,
                trackColor: spaceGreyLight,
                value: value,
                onChanged: onChanged,
              )
      ],
    );
  }
}
