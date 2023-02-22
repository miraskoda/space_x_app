import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import 'package:space_x_app/app/app.locator.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:space_x_app/config/services/error_dialog_prompt.dart';
import 'package:space_x_app/config/services/exception_tracker.dart';
import 'package:space_x_app/core/managers/data_holder.dart';
import 'package:space_x_app/data/models/company_info_model/company_model.dart';
import 'package:space_x_app/data/repository/space_repository.dart';
import 'package:stacked/stacked.dart';

class CompanyViewModel extends BaseViewModel {
  final RemoteConfigService remoteConfigService = inject<RemoteConfigService>();
  final SpaceRepository _spaceRepository = inject<SpaceRepository>();
  final DataHolder _dataHolder = inject<DataHolder>();

  CompanyModel? data;

  void initialise(BuildContext context) {
    if (_dataHolder.company == null) {
      _fetchCompany(context);
    } else {
      data = _dataHolder.company;
    }
  }

  Future<void> _fetchCompany(BuildContext context) async {
    try {
      HttpResponse<CompanyModel> response =
          await runBusyFuture(_spaceRepository.company());
      data = response.data;
      _dataHolder.company = data;
    } catch (e) {
      ExceptionTracker.trackCatchError(e);
      ErrorDialogPrompt.track(context, () {
        _fetchCompany(context);
      });
    }
  }
}
