import 'package:movies_app/layers/data/datasources/get_movie_by_id_datasource.dart';
import 'package:movies_app/layers/domain/entities/movie_detail_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/layers/domain/repositories/get_movie_by_id_repository.dart';

class GetMovieByIdRepositoryImp implements GetMovieByIdRepository {
  final GetMovieByIdDataSource _getMovieByIdDataSource;
  GetMovieByIdRepositoryImp(this._getMovieByIdDataSource);

  @override
  Future<Either<Exception, MovieDetailEntity>> call(int id) {
    return _getMovieByIdDataSource(id);
  }
}
