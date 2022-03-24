import 'package:dartz/dartz.dart';
import 'package:movies_app/layers/domain/entities/cast_movie_entity.dart';

abstract class GetCastByIdUseCase {
  Future<Either<Exception, List<CastMovieEntity>>> call(int id);
}
