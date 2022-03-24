import 'package:movies_app/core/domain/services/http_service.dart';
import 'package:movies_app/core/utils/helper_api.dart';
import 'package:movies_app/core/utils/movie_type.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/layers/data/datasources/get_list_movie_datasource.dart';
import 'package:movies_app/layers/data/dtos/movie_dto.dart';
import 'package:movies_app/layers/domain/entities/movie_entity.dart';

class GetListMovieRemoteDataSourceImp implements GetListMovieDataSource {
  final HttpService _httpService;
  GetListMovieRemoteDataSourceImp(this._httpService);

  @override
  Future<Either<Exception, List<MovieEntity>>> call(MovieType type) async {
    late String url;

    switch (type) {
      case MovieType.moviePopular:
        url = HelperApi.URL_MOVIES_POPULAR_API;
        break;
      case MovieType.movieTopRated:
        url = HelperApi.URL_MOVIES_TOP_RATED_API;
        break;
      case MovieType.movieUpComing:
        url = HelperApi.URL_MOVIES_UP_COMING_API;
        break;
      default:
        url = HelperApi.URL_MOVIES_POPULAR_API;
    }

    try {
      var result = await _httpService.get(url);
      return Right(
        List.from(result.data['results']).map((e) => MovieDto.fromJson(e)).toList(),
      );
    } catch (e) {
      return Left(Exception('Error in data source imp'));
    }
  }
}
