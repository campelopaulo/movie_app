import 'package:mobx/mobx.dart';
import 'package:movies_app/core/utils/future_state.dart';
import 'package:movies_app/layers/domain/entities/cast_movie_entity.dart';
import 'package:movies_app/layers/domain/usecases/get_cast_by_id/get_cast_by_id_usecase.dart';
part 'get_cast_by_id_controller.g.dart';

class GetCastByIdController = GetCastByIdControllerBase with _$GetCastByIdController;

abstract class GetCastByIdControllerBase with Store {
  final GetCastByIdUseCase _getCastByIdUseCase;
  GetCastByIdControllerBase(this._getCastByIdUseCase);

  @observable
  FutureState futureState = FutureState.loading;

  late List<CastMovieEntity> cast = [];

  @action
  fetch(int id) async {
    var result = await _getCastByIdUseCase(id);
    result.fold(
      (error) => {
        futureState = FutureState.error,
      },
      (success) => {
        cast = success.take(15).toList(),
        futureState = FutureState.success,
      },
    );
  }
}
