import 'package:flutter/material.dart';
import 'package:space_x_app/core/constants/constants.dart';

class TabletWrapper extends StatelessWidget {
  Widget? child;
  bool reducedWithInLandscape;
  TabletWrapper({this.child, this.reducedWithInLandscape = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      return Center(
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: orientation == Orientation.portrait
                      ? kMaxTabletWidthContent
                      : reducedWithInLandscape
                          ? kMaxTabletWidthContent
                          : double.infinity),
              child: child));
    });
  }
}
