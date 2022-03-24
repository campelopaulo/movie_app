import 'package:dartz/dartz.dart';
import 'package:movies_app/layers/domain/entities/movie_detail_entity.dart';

abstract class GetMovieByIdUseCase {
  Future<Either<Exception, MovieDetailEntity>> call(int id);
}
