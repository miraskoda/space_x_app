import 'package:retrofit/dio.dart';
import 'package:space_x_app/api/space_api_service.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/data/repository/space_repository.dart';

class SpaceRepositoryImpl extends SpaceRepository {
  SpaceApiService get _spaceApiService =>
      SpaceApiService(dio, baseUrl: kBaseUrl);

  @override
  Future<HttpResponse> latestLaunches() => _spaceApiService.latestLaunches();
}
