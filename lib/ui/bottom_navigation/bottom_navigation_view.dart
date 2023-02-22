import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/config/theme/light_theme.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/ui/bottom_navigation/bottom_navigation_viewmodel.dart';
import 'package:space_x_app/ui/bottom_navigation/company/company_view.dart';
import 'package:space_x_app/ui/bottom_navigation/past_launches/past_launches_view.dart';
import 'package:space_x_app/ui/bottom_navigation/settings/settings_view.dart';
import 'package:space_x_app/ui/bottom_navigation/upcomming_launches/upcomming_view.dart';
import 'package:space_x_app/ui/uni_widgets/light_watermark.dart';
import 'package:stacked/stacked.dart';

class BottomNavigation extends StatefulWidget {
  final int? initialIndex;

  const BottomNavigation({Key? key, this.initialIndex}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final Map<int, Widget> _viewCache = <int, Widget>{};

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
          body: LightWatermark(child: getViewForIndex(viewModel.index)),
          bottomNavigationBar: orientation == Orientation.portrait || kIsWeb
              ? Material(
                  color: context.theme.primaryColorDark,
                  elevation: 0.0,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedLabelStyle: const TextStyle(fontSize: 11),
                    unselectedLabelStyle: const TextStyle(fontSize: 11),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    currentIndex: viewModel.index,
                    unselectedItemColor: context.theme.primaryColorLight,
                    selectedItemColor: context.theme.backgroundColor,
                    onTap: (int i) => viewModel.setTabIndex(i, context),
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        label: "Past",
                        icon: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.rocket,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Upcomming",
                        icon: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.rocket,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Company",
                        icon: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.factory,
                          ),
                        ),
                      ),
                      BottomNavigationBarItem(
                        label: "Settings",
                        icon: Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.settings,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : null,
        );
      }),
      viewModelBuilder: () => BottomNavigationViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    if (!_viewCache.containsKey(index)) {
      switch (index) {
        case kFirstIndex:
          _viewCache[index] = const PastLaunchesView();
          break;
        case kSecondIndex:
          _viewCache[index] = const UpcommingView();
          break;
        case kThirdIndex:
          _viewCache[index] = const CompanyView();
          break;
        case kSettingsIndex:
          _viewCache[index] = const SettingsView();
          break;
      }
    }

    return _viewCache[index]!;
  }
}
