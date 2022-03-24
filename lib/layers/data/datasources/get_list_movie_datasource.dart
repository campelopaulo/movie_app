import 'package:dartz/dartz.dart';
import 'package:movies_app/core/utils/movie_type.dart';
import 'package:movies_app/layers/domain/entities/movie_entity.dart';

abstract class GetListMovieDataSource {
  Future<Either<Exception, List<MovieEntity>>> call(MovieType type);
}
