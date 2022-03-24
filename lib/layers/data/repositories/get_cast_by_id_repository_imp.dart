import 'package:dartz/dartz.dart';
import 'package:movies_app/layers/data/datasources/get_cast_by_id_datasource.dart';
import 'package:movies_app/layers/domain/entities/cast_movie_entity.dart';
import 'package:movies_app/layers/domain/repositories/get_cast_by_id_repository.dart';

class GetCastByIdRepositoryImp implements GetCastByIdRepository {
  final GetCastByIdDataSource _getCastByIdDataSource;
  GetCastByIdRepositoryImp(this._getCastByIdDataSource);

  @override
  Future<Either<Exception, List<CastMovieEntity>>> call(int id) {
    return _getCastByIdDataSource(id);
  }
}
