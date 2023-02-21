import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/config/theme/light_theme.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/ui/bottom_navigation/bottom_navigation_viewmodel.dart';
import 'package:space_x_app/ui/bottom_navigation/first/first_view.dart';
import 'package:space_x_app/ui/uni_widgets/light_watermark.dart';
import 'package:stacked/stacked.dart';

class BottomNavigation extends StatefulWidget {
  final int? initialIndex;

  const BottomNavigation({Key? key, this.initialIndex}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  GlobalKey mainBtnKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavigationViewModel>.reactive(
      onModelReady: (BottomNavigationViewModel viewModel) =>
          viewModel.initialise(context, viewModel),
      builder: (BuildContext context, BottomNavigationViewModel viewModel,
              Widget? child) =>
          OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          body: LightWatermark(child: const FirstView()),
          bottomNavigationBar: orientation == Orientation.portrait
              ? Material(
                  color: spacePrimaryLight,
                  elevation: 0.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width < 360 ? 60 : 86,
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      enableFeedback: false,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      selectedLabelStyle: const TextStyle(fontSize: 11),
                      unselectedLabelStyle: const TextStyle(fontSize: 11),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      currentIndex: kFirstIndex,
                      selectedItemColor: context.theme.primaryColorDark,
                      unselectedItemColor: context.theme.primaryColorDark,
                      onTap: (int i) => viewModel.setTabIndex(i, context),
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          label: "",
                          icon: Transform.translate(
                            offset: Offset(
                                0,
                                MediaQuery.of(context).size.width < 360
                                    ? 0
                                    : 10),
                            child: SvgPicture.asset(
                              "assets/svg/home.svg",
                              color: context.theme.primaryColor,
                            ),
                          ),
                        ),
                        BottomNavigationBarItem(
                          label: "",
                          icon: Transform.translate(
                            offset: Offset(
                                0,
                                MediaQuery.of(context).size.width < 360
                                    ? 0
                                    : 10),
                            child: SvgPicture.asset(
                              "assets/svg/setting.svg",
                              width: 22,
                              height: 22,
                              color: context.theme.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : null,
        );
      }),
      viewModelBuilder: () => BottomNavigationViewModel(),
    );
  }
}
