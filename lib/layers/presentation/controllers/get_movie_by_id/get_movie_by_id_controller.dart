import 'package:mobx/mobx.dart';
import 'package:movies_app/core/utils/future_state.dart';
import 'package:movies_app/layers/domain/entities/movie_detail_entity.dart';
import 'package:movies_app/layers/domain/usecases/get_movie_by_id/get_movie_by_id_usecase.dart';
part 'get_movie_by_id_controller.g.dart';

class GetMovieByIdController = GetMovieByIdControllerBase with _$GetMovieByIdController;

abstract class GetMovieByIdControllerBase with Store {
  final GetMovieByIdUseCase _getMovieByIdUseCase;
  GetMovieByIdControllerBase(this._getMovieByIdUseCase);

  @observable
  FutureState futureState = FutureState.loading;

  late MovieDetailEntity movie;

  @action
  fetch(int id) async {
    var result = await _getMovieByIdUseCase(id);
    result.fold(
      (error) => {
        futureState = FutureState.error,
      },
      (success) => {
        movie = success,
        futureState = FutureState.success,
      },
    );
  }
}
