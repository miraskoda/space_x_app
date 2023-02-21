import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'space_api_service.g.dart';

@RestApi()
abstract class SpaceApiService {
  factory SpaceApiService(Dio dio, {String baseUrl}) = _SpaceApiService;

  @GET('v5/launches/latest')
  Future<HttpResponse<dynamic>> latestLaunches();
}
