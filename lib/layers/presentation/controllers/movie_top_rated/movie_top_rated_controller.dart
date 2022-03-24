import 'package:mobx/mobx.dart';
import 'package:movies_app/core/utils/future_state.dart';
import 'package:movies_app/core/utils/movie_type.dart';
import 'package:movies_app/layers/domain/entities/movie_entity.dart';
import 'package:movies_app/layers/domain/usecases/get_list_movie/get_list_movie_usecase.dart';
part 'movie_top_rated_controller.g.dart';

class MovieTopRatedController = MovieTopRatedControllerBase with _$MovieTopRatedController;

abstract class MovieTopRatedControllerBase with Store {
  final GetListMovieUseCase _getListMovieUseCase;
  MovieTopRatedControllerBase(this._getListMovieUseCase) {
    fetch();
  }

  @observable
  FutureState futureState = FutureState.loading;

  late List<MovieEntity> movies = [];

  @action
  fetch() async {
    var result = await _getListMovieUseCase(MovieType.movieTopRated);
    result.fold(
      (error) => {
        futureState = FutureState.error,
      },
      (success) => {
        movies = success,
        futureState = FutureState.success,
      },
    );
  }
}
