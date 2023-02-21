import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/config/firebase/analytics_service.dart';
import 'package:space_x_app/config/theme/light_theme.dart';

class PrimaryButton extends StatelessWidget {
  final String? tooltipMessage;
  final bool isBusy;
  final Widget? child;
  final String? text;
  final String? trackingId;
  final bool? secondary;
  final double? minWidth;
  final double? minHeight;
  final VoidCallback onPressed;
  final Color? specialBorder;
  final bool disabledMode;
  final bool warningMode;
  final EdgeInsets? padding;
  final double? elevationCustome;
  final bool continueIcon;
  final bool beforeIcon;
  final String? label;

  const PrimaryButton({
    Key? key,
    this.child,
    this.isBusy = false,
    this.minWidth,
    this.minHeight,
    this.secondary,
    this.specialBorder,
    this.text,
    this.label,
    this.trackingId,
    this.padding,
    this.elevationCustome,
    required this.onPressed,
    this.disabledMode = false,
    this.warningMode = false,
    this.continueIcon = false,
    this.beforeIcon = false,
    this.tooltipMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: text ?? label ?? "button",
      container: true,
      child: Tooltip(
        message: tooltipMessage ?? text ?? '',
        child: TextButton(
          onPressed: disabledMode
              ? null
              : isBusy
                  ? null
                  : () {
                      handleTrackedClick(elementId: trackingId, copy: text);
                      onPressed();
                    },
          style: TextButton.styleFrom(
            foregroundColor: context.theme.backgroundColor,
            elevation: elevationCustome ?? 3,
            minimumSize: Size(minWidth ?? 170, minHeight ?? 40),
            textStyle: context.theme.textTheme.button!.copyWith(
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: secondary == true ? spacePrimaryDark : Colors.white),
            backgroundColor: disabledMode && secondary == true
                ? Colors.white
                : disabledMode
                    ? spaceGreyBright
                    : secondary == true
                        ? Colors.white
                        : warningMode
                            ? spaceRedSemiDark
                            : context.theme.primaryColor,
            shadowColor: disabledMode
                ? Colors.transparent
                : secondary == true
                    ? spacePrimary.withOpacity(0.2)
                    : spacePrimary,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: disabledMode && secondary == true
                      ? spaceGreySemiLight
                      : disabledMode
                          ? Colors.transparent
                          : specialBorder ??
                              (warningMode ? spaceRed : Colors.transparent)),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: isBusy
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: Colors.white),
                )
              : (child ??
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (beforeIcon)
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: SvgPicture.asset(
                            "assets/svg/phoneHangup.svg",
                            color: Colors.white,
                            width: 20,
                          ),
                        ),
                      Text(
                        text ?? "",
                        style: context.theme.textTheme.button!.copyWith(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: disabledMode
                                ? Colors.black
                                : secondary == true
                                    ? spacePrimaryDark
                                    : Colors.white),
                      ),
                      if (continueIcon)
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: SvgPicture.asset("assets/svg/rightArrow.svg"),
                        )
                    ],
                  )),
        ),
      ),
    );
  }
}
