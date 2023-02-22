import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:space_x_app/app/app.logger.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:stacked/stacked.dart';

class BottomNavigationViewModel extends BaseViewModel {
  final Logger log = getLogger('Third');
  int index = kFirstIndex;

  BottomNavigationViewModel() {
    log.i('initialise');
  }
  void initialise(BuildContext ctx, BottomNavigationViewModel viewModel) async {
    log.i("initialised bottom menu");
  }

  void setTabIndex(int index, BuildContext context) async {
    this.index = index;
    notifyListeners();
  }
}
