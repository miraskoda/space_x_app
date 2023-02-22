import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:space_x_app/config/services/error_dialog_prompt.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/core/managers/data_holder.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/data/repository/space_repository.dart';
import 'package:stacked/stacked.dart';

class UpcommingViewModel extends BaseViewModel {
  final RemoteConfigService remoteConfigService = inject<RemoteConfigService>();
  final SpaceRepository _spaceRepository = inject<SpaceRepository>();
  final DataHolder _dataHolder = inject<DataHolder>();

  List<LaunchModel>? data;

  void initialise(BuildContext context) {
    if (_dataHolder.upcomming == null) {
      _fetchUpcomming(context);
    } else {
      data = _dataHolder.upcomming;
    }
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
}
