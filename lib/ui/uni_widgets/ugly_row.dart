import 'package:flutter/material.dart';

Widget uglyRow(String text1, String text2, {bool divider = true}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (divider) const Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(text1),
          ),
          Flexible(
            child: Text(text2),
          ),
        ],
      ),
    ],
  );
}
