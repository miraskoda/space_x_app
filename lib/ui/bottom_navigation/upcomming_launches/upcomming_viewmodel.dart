import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:retrofit/dio.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/app/app.router.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:space_x_app/config/services/error_dialog_prompt.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/core/managers/data_holder.dart';
import 'package:space_x_app/core/utils/shared_prefs_utility.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/data/repository/space_repository.dart';
import 'package:space_x_app/ui/uni_widgets/filter_bottom_sheet/filter_bottom_sheet.dart';
import 'package:space_x_app/ui/uni_widgets/filter_bottom_sheet/filter_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UpcommingViewModel extends BaseViewModel {
  final RemoteConfigService remoteConfigService = inject<RemoteConfigService>();
  final SpaceRepository _spaceRepository = inject<SpaceRepository>();
  final DataHolder _dataHolder = inject<DataHolder>();
  final NavigationService _navigationService = inject<NavigationService>();

  FilterModel response = FilterModel();

  List<LaunchModel>? data;

  void initialise(BuildContext context) async {
    response = await SharedprefsUtility.load('up');
    if (_dataHolder.upcomming == null) {
      _fetchUpcomming(context);
    } else {
      data = _dataHolder.upcomming;
    }
    notifyListeners();
  }

  Future<void> _fetchUpcomming(BuildContext context) async {
    try {
      HttpResponse<List<LaunchModel>> response =
          await runBusyFuture(_spaceRepository.upcommingLaunches());
      data = response.data;
      _dataHolder.upcomming = data;
    } catch (e) {
      ExceptionTracker.trackCatchError(e);
      ErrorDialogPrompt.track(context, () {
        _fetchUpcomming(context);
      });
    }
  }

  toDetail(LaunchModel item) async {
    await _navigationService.navigateTo(Routes.upcommingDetailView,
        arguments: UpcommingDetailViewArguments(item: item));
    Fluttertoast.showToast(msg: "Enjoy!");
  }

  void toFiltering(BuildContext context) async {
    var res = await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        isScrollControlled: false,
        constraints: BoxConstraints(
            maxWidth: kMaxTabletWidthContent,
            maxHeight: max(MediaQuery.of(context).size.height / 3, 500)),
        context: context,
        builder: (BuildContext context) {
          return FilterBottomSheet(
            response: response,
          );
        });
    if (res == null) return;
    response = res;
    await SharedprefsUtility.save(res, 'up');
    notifyListeners();
  }
}
