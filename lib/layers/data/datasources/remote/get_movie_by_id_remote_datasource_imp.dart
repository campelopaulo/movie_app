import 'package:dartz/dartz.dart';
import 'package:movies_app/core/domain/services/http_service.dart';
import 'package:movies_app/core/utils/helper_api.dart';
import 'package:movies_app/layers/data/datasources/get_movie_by_id_datasource.dart';
import 'package:movies_app/layers/data/dtos/movie_detail_dto.dart';
import 'package:movies_app/layers/domain/entities/movie_detail_entity.dart';

class GetMovieByIdRemoteDataSourceImp implements GetMovieByIdDataSource {
  final HttpService _httpService;
  GetMovieByIdRemoteDataSourceImp(this._httpService);

  @override
  Future<Either<Exception, MovieDetailEntity>> call(int id) async {
    try {
      var result = await _httpService.get(HelperApi.URL_MOVIE_DETAIL_API(id));
      return Right(MovieDetailDto.fromJson(result.data));
    } catch (e) {
      return Left(Exception('Error in data source imp'));
    }
  }
}
