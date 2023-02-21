import 'package:retrofit/dio.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/data/repository/base_repository.dart';

abstract class SpaceRepository extends BaseRepository {
  Future<HttpResponse<List<LaunchModel>>> upcommingLaunches();
  Future<HttpResponse<List<LaunchModel>>> pastLaunches();
}
