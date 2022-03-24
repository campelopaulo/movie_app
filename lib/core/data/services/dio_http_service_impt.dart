import 'package:dio/dio.dart';
import 'package:movies_app/core/domain/services/http_service.dart';
import 'package:movies_app/core/utils/helper_api.dart';

class DioHttpServiceImp implements HttpService {
  late Dio _dio;
  DioHttpServiceImp() {
    _dio = Dio(
      BaseOptions(
        baseUrl: HelperApi.URL_API,
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3Yzk3YzliZWM4NTcxOTNiMDNkZGQ4ZTMzNjkxOTBiOCIsInN1YiI6IjYyMTZiZGMyOTBiODdlMDA0MzBlYjUwZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.u1gSKae5Ys9Pm24l3R_E_ytezHsHu8QEAmwsTjVeH8k',
        },
      ),
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }
}
