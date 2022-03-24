import 'package:movies_app/layers/domain/entities/movie_detail_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/layers/domain/repositories/get_movie_by_id_repository.dart';
import 'package:movies_app/layers/domain/usecases/get_movie_by_id/get_movie_by_id_usecase.dart';

class GetMovieByIdUseCaseImp implements GetMovieByIdUseCase {
  final GetMovieByIdRepository _getMovieByIdRepository;
  GetMovieByIdUseCaseImp(this._getMovieByIdRepository);

  @override
  Future<Either<Exception, MovieDetailEntity>> call(int id) async {
    return await _getMovieByIdRepository(id);
  }
}
