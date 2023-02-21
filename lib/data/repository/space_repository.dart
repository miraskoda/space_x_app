import 'package:retrofit/dio.dart';
import 'package:space_x_app/data/repository/base_repository.dart';

abstract class SpaceRepository extends BaseRepository {
  Future<HttpResponse<dynamic>> latestLaunches();
}
