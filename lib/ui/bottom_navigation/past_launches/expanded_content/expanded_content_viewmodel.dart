import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:space_x_app/config/services/error_dialog_prompt.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/data/models/rocket_model/rocket_model.dart';
import 'package:space_x_app/data/repository/space_repository.dart';
import 'package:stacked/stacked.dart';

class ExpandedContentViewModel extends BaseViewModel {
  final RemoteConfigService remoteConfigService = inject<RemoteConfigService>();
  final SpaceRepository _spaceRepository = inject<SpaceRepository>();

  String? id;
  RocketModel? data;

  void initialise(BuildContext context, String? id) async {
    this.id = id;
    _fetchContent(context);
  }

  Future<void> _fetchContent(BuildContext context) async {
    if (id == null) return;
    try {
      HttpResponse<RocketModel> response =
          await runBusyFuture(_spaceRepository.rocket(id!));
      data = response.data;
    } catch (e) {
      ExceptionTracker.trackCatchError(e);
      ErrorDialogPrompt.track(context, () {
        _fetchContent(context);
      });
    }
  }

  viewImage(String image, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: Image.network(
                image,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset('assets/images/random_rocket.jpg'),
              ),
            ));
  }
}
