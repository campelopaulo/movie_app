import 'package:movies_app/layers/domain/entities/movie_entity.dart';
import 'package:movies_app/core/utils/movie_type.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/layers/domain/repositories/get_list_movie_repository.dart';
import 'package:movies_app/layers/domain/usecases/get_list_movie/get_list_movie_usecase.dart';

class GetListMovieUseCaseImp implements GetListMovieUseCase {
  final GetListMovieRepository _getListMovieRepository;
  GetListMovieUseCaseImp(this._getListMovieRepository);

  @override
  Future<Either<Exception, List<MovieEntity>>> call(MovieType type) async {
    return await _getListMovieRepository(type);
  }
}
