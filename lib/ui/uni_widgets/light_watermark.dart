import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_x_app/config/theme/light_theme.dart';

class LightWatermark extends StatelessWidget {
  Widget? child;
  bool secondary;
  LightWatermark({this.child, this.secondary = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          color: spaceWhite,
          alignment: Alignment.bottomRight,
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Opacity(
            opacity: 0.05,
            child: SvgPicture.asset(
              secondary
                  ? "assets/svg/logoIcon.svg"
                  : "assets/svg/logoIconSmall.svg",
              width: secondary
                  ? MediaQuery.of(context).size.width / 2
                  : MediaQuery.of(context).size.width,
              height: secondary
                  ? MediaQuery.of(context).size.height / 1.5
                  : MediaQuery.of(context).size.height / 2,
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
