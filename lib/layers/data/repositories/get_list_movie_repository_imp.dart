import 'package:movies_app/core/utils/movie_type.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/layers/data/datasources/get_list_movie_datasource.dart';
import 'package:movies_app/layers/domain/entities/movie_entity.dart';
import 'package:movies_app/layers/domain/repositories/get_list_movie_repository.dart';

class GetListMovieRepositoryImp implements GetListMovieRepository {
  final GetListMovieDataSource _getListMovieDataSource;
  GetListMovieRepositoryImp(this._getListMovieDataSource);

  @override
  Future<Either<Exception, List<MovieEntity>>> call(MovieType type) {
    return _getListMovieDataSource(type);
  }
}
