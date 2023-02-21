import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/data/models/company_info_model/company_model.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/data/repository/space_repository.dart';
import 'package:stacked/stacked.dart';

class ThirdViewModel extends BaseViewModel {
  final RemoteConfigService remoteConfigService = inject<RemoteConfigService>();
  final SpaceRepository _spaceRepository = inject<SpaceRepository>();

  CompanyModel? data;

  void initialise(
    BuildContext context,
  ) {
    _fetchUpcomming();
  }

  Future<void> _fetchUpcomming() async {
    try {
      HttpResponse<CompanyModel> response =
          await runBusyFuture(_spaceRepository.company());
      data = response.data;
    } catch (e) {
      ExceptionTracker.trackCatchError(e);
    }
  }
}
