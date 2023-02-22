import 'package:local_auth/local_auth.dart';
import 'package:space_x_app/data/models/company_info_model/company_model.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';

class DataHolder {
  CompanyModel? company;
  List<LaunchModel>? past;
  List<LaunchModel>? upcomming;
  List<BiometricType>? biometricsAvailable;

  DataHolder() {
    LocalAuthentication().getAvailableBiometrics().then((value) {
      biometricsAvailable = value;
    });
  }
}
