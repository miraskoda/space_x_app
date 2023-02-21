import 'package:dio/dio.dart';
import 'package:space_x_app/core/interceptors/token_interceptor.dart';

abstract class BaseRepository {
  Dio get dio {
    Dio dio = Dio();
    dio.interceptors.add(TokenInterceptor(dio));
    return dio;
  }
}
