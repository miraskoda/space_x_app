import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:space_x_app/config/extensions/extensions.dart';

Widget shimmer(double height, BuildContext context) {
  return Shimmer.fromColors(
    baseColor: context.theme.primaryColorLight.withOpacity(0.25),
    highlightColor: context.theme.primaryColor.withOpacity(0.25),
    child: Container(
      height: height,
      // margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
    ),
  );
}
