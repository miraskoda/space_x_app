import 'package:retrofit/dio.dart';
import 'package:space_x_app/api/space_api_service.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/data/models/company_info_model/company_model.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/data/repository/space_repository.dart';

class SpaceRepositoryImpl extends SpaceRepository {
  SpaceApiService get _spaceApiService =>
      SpaceApiService(dio, baseUrl: kBaseUrl);

  @override
  Future<HttpResponse<List<LaunchModel>>> pastLaunches() =>
      _spaceApiService.pastLaunches();

  @override
  Future<HttpResponse<List<LaunchModel>>> upcommingLaunches() =>
      _spaceApiService.upcommingLaunches();

  @override
  Future<HttpResponse<CompanyModel>> company() =>
      _spaceApiService.companyInfo();
}
