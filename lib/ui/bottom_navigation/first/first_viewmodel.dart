import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/data/repository/space_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FirstViewModel extends BaseViewModel {
  final NavigationService _navigationService = inject<NavigationService>();
  final RemoteConfigService remoteConfigService = inject<RemoteConfigService>();
  final SharedPreferences _sharedPreferences = inject<SharedPreferences>();
  final SpaceRepository _spaceRepository = inject<SpaceRepository>();

  List<LaunchModel>? data;

  void initialise(BuildContext context) async {
    _fetchPast();
  }

  Future<void> _fetchPast() async {
    try {
      HttpResponse<List<LaunchModel>> response =
          await runBusyFuture(_spaceRepository.pastLaunches());
      data = response.data;
    } catch (e) {
      data = [];
      ExceptionTracker.trackCatchError(e);
    }
  }
}
