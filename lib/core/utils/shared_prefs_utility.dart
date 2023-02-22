import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/ui/uni_widgets/filter_bottom_sheet/filter_model.dart';

class SharedprefsUtility {
  static Future<void> save(FilterModel response, String prefix) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString(
        kFulltextFilterKey + prefix, response.fulltext ?? '');

    sharedPreferences.setBool(
        kSuccessFilterKey + prefix, response.success ?? false);

    sharedPreferences.setString(
        kFlightNumberFilterKey + prefix, response.flightNumber ?? '');

    sharedPreferences.setBool(
        kRecoveredFilterKey + prefix, response.recovered ?? false);

    sharedPreferences.setBool(
        kReusedFilterKey + prefix, response.reused ?? false);
  }

  static Future<FilterModel> load(String prefix) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return FilterModel(
        flightNumber:
            sharedPreferences.getString(kFlightNumberFilterKey + prefix),
        success: sharedPreferences.getBool(kSuccessFilterKey + prefix),
        fulltext: sharedPreferences.getString(kFulltextFilterKey + prefix),
        recovered: sharedPreferences.getBool(kRecoveredFilterKey + prefix),
        reused: sharedPreferences.getBool(kReusedFilterKey + prefix));
  }
}
