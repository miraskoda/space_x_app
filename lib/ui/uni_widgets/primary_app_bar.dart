import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_x_app/config/extensions/extensions.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;
  final String? title;
  final double? titleSpacing;
  final Color? backgroundColor;
  final bool leading;
  final Function()? customLeading;
  final bool centeredTitle;
  List<Widget>? actions;
  final double? elevation;

  PrimaryAppBar(
      {Key? key,
      double height = 50,
      this.actions,
      this.child,
      this.title,
      this.leading = false,
      this.titleSpacing,
      this.customLeading,
      this.backgroundColor,
      this.centeredTitle = false,
      this.elevation})
      : preferredSize = Size.fromHeight(height),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      title: title != null
          ? Padding(
              padding: EdgeInsets.all(leading ? 0 : 25),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  title!,
                  style: context.theme.textTheme.bodyText1!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 22),
                ),
              ),
            )
          : null,
      elevation: elevation ?? 0.0,
      titleSpacing: 0,
      centerTitle: centeredTitle,
      leading: leading
          ? MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => customLeading != null
                    ? customLeading!()
                    : Navigator.of(context).pop(),
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: SvgPicture.asset(
                          "assets/svg/chevron_left_gray.svg",
                          width: 14,
                        ),
                      ),
                    )),
              ),
            )
          : null,
      actions: actions,
      automaticallyImplyLeading: false,
      shadowColor: theme.shadowColor,
      backgroundColor: backgroundColor ?? theme.backgroundColor,
    );
  }
}