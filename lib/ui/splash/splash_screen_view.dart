import 'dart:math';
import 'package:flutter/material.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/ui/splash/splash_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onViewModelReady: (SplashViewModel model) => model.init(context),
      builder:
          (BuildContext context, SplashViewModel viewModel, Widget? child) {
        return SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: min(context.mq.size.width / 1.5, 400),
              child: Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: 1,
                  child: Image.asset("assets/images/space_x_logo.png"),
                ),
              ),
            ),
          ],
        ));
      },
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
