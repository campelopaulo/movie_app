import 'package:movies_app/layers/domain/entities/cast_movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/layers/domain/repositories/get_cast_by_id_repository.dart';
import 'package:movies_app/layers/domain/usecases/get_cast_by_id/get_cast_by_id_usecase.dart';

class GetCastByIdUseCaseImp implements GetCastByIdUseCase {
  final GetCastByIdRepository _getCastByIdRepository;
  GetCastByIdUseCaseImp(this._getCastByIdRepository);

  @override
  Future<Either<Exception, List<CastMovieEntity>>> call(int id) async {
    return await _getCastByIdRepository(id);
  }
}
