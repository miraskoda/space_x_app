import 'package:flutter/material.dart';
import 'package:space_x_app/config/extensions/extensions.dart';

class FilterIcon extends StatelessWidget {
  Widget? child;
  void Function()? onPressed;

  FilterIcon({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (child != null)
          Positioned(
            bottom: 10,
            right: 10,
            child: CircleAvatar(
              backgroundColor: context.theme.errorColor,
              radius: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 1),
                child: child,
              ),
            ),
          ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.filter_alt,
            size: 30,
          ),
        ),
      ],
    );
  }
}
