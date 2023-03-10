import 'package:flutter/material.dart';
import 'package:space_x_app/config/extensions/extensions.dart';

class LightWatermark extends StatelessWidget {
  Widget? child;
  LightWatermark({this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          color: context.theme.backgroundColor,
          alignment: Alignment.center,
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Opacity(
            opacity: 0.03,
            child: Image.asset(
              "assets/images/space_x_logo.png",
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
            ),
          ),
        ),
      ),
      ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: MediaQuery.of(context).size.height,
        ),
      ),
      child ?? const SizedBox.shrink()
    ]);
  }
}
