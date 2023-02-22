import 'dart:math';

import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:space_x_app/config/services/error_dialog_prompt.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/core/managers/data_holder.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/data/repository/space_repository.dart';
import 'package:space_x_app/ui/uni_widgets/filter_bottom_sheet/filter_bottom_sheet.dart';
import 'package:space_x_app/ui/uni_widgets/filter_bottom_sheet/filter_model.dart';
import 'package:stacked/stacked.dart';

class PastLaunchesViewModel extends BaseViewModel {
  final RemoteConfigService remoteConfigService = inject<RemoteConfigService>();
  final SharedPreferences _sharedPreferences = inject<SharedPreferences>();
  final SpaceRepository _spaceRepository = inject<SpaceRepository>();
  final DataHolder _dataHolder = inject<DataHolder>();
  List<String> expandedTiles = [];

  FilterModel response = FilterModel();

  List<LaunchModel>? data;

  void initialise(BuildContext context) async {
    if (_dataHolder.past == null) {
      _fetchPast(context);
    } else {
      data = _dataHolder.past;
    }
  }

  Future<void> _fetchPast(BuildContext context) async {
    try {
      HttpResponse<List<LaunchModel>> response =
          await runBusyFuture(_spaceRepository.pastLaunches());
      data = response.data;
      _dataHolder.past = data;
    } catch (e) {
      ExceptionTracker.trackCatchError(e);
      ErrorDialogPrompt.track(context, () {
        _fetchPast(context);
      });
    }
  }

  bool isExpanded(String? id) {
    return expandedTiles.contains(id);
  }

  void setExpanded(String id) {
    if (expandedTiles.contains(id)) {
      expandedTiles.remove(id);
    } else {
      expandedTiles.add(id);
    }
    notifyListeners();
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
    notifyListeners();
  }
}
