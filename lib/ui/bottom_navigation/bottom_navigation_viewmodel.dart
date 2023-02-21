import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:space_x_app/app/app.logger.dart';
import 'package:stacked/stacked.dart';

class BottomNavigationViewModel extends BaseViewModel {
  final Logger log = getLogger('Third');

  BottomNavigationViewModel() {
    log.i('initialise');
  }
  void initialise(BuildContext ctx, BottomNavigationViewModel viewModel) async {
    log.i("initialised bottom menu");
  }

  void setTabIndex(int value, BuildContext context) async {
    notifyListeners();
  }
}
