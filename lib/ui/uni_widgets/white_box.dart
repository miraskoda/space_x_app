import 'package:flutter/material.dart';
import 'package:space_x_app/config/extensions/extensions.dart';

class WhiteBox extends StatelessWidget {
  Widget? child;
  Color? color;
  bool condensed;
  bool horizontalCondensed;
  BoxBorder? border;
  BorderRadiusGeometry? borderRadius;

  WhiteBox(
      {this.color = Colors.white,
      Key? key,
      this.condensed = false,
      this.horizontalCondensed = false,
      this.child,
      this.border,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 1,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
            border: border,
            color: color,
            borderRadius:
                borderRadius ?? const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 5,
                  color: context.theme.shadowColor.withOpacity(0.05))
            ]),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalCondensed ? 5 : 20,
                vertical: condensed ? 10 : 30),
            child: child),
      ),
    );
  }
}
