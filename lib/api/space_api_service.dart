import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:space_x_app/data/models/company_info_model/company_model.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/data/models/rocket_model/rocket_model.dart';

part 'space_api_service.g.dart';

@RestApi()
abstract class SpaceApiService {
  factory SpaceApiService(Dio dio, {String baseUrl}) = _SpaceApiService;

  @GET('/v5/launches/upcoming')
  Future<HttpResponse<List<LaunchModel>>> upcommingLaunches();

  @GET('/v5/launches/past')
  Future<HttpResponse<List<LaunchModel>>> pastLaunches();

  @GET('/v4/rockets/{id}')
  Future<HttpResponse<RocketModel>> rocket(@Path("id") String id);

  @GET('/v4/company')
  Future<HttpResponse<CompanyModel>> companyInfo();
}
