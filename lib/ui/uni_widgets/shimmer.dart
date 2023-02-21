import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space_x_app/config/theme/light_theme.dart';

Widget shimmer(double height) {
  return Shimmer.fromColors(
    baseColor: spaceGreyLight.withOpacity(0.25),
    highlightColor: spaceGreyDark.withOpacity(0.25),
    child: Container(
      height: height,
      // margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
    ),
  );
}
