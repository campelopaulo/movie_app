import 'package:dartz/dartz.dart';
import 'package:movies_app/core/domain/services/http_service.dart';
import 'package:movies_app/core/utils/helper_api.dart';
import 'package:movies_app/layers/data/datasources/get_cast_by_id_datasource.dart';
import 'package:movies_app/layers/data/dtos/cast_movie_dto.dart';
import 'package:movies_app/layers/domain/entities/cast_movie_entity.dart';

class GetCastByIdRemoteDataSourceImp implements GetCastByIdDataSource {
  final HttpService _httpService;
  GetCastByIdRemoteDataSourceImp(this._httpService);

  @override
  Future<Either<Exception, List<CastMovieEntity>>> call(int id) async {
    try {
      var result = await _httpService.get(HelperApi.URL_CAST_MOVIE_API(id));
      return Right(List.from(result.data['cast']).map((e) => CastMovieDto.fromJson(e)).toList());
    } catch (e) {
      return Left(Exception('Error in data source imp'));
    }
  }
}
