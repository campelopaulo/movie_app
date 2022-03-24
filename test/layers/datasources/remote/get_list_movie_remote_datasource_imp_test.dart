import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/core/data/services/dio_http_service_impt.dart';
import 'package:movies_app/core/domain/services/http_service.dart';
import 'package:movies_app/core/utils/movie_type.dart';
import 'package:movies_app/layers/data/datasources/get_list_movie_datasource.dart';
import 'package:movies_app/layers/data/datasources/remote/get_list_movie_remote_datasource_imp.dart';
import 'package:movies_app/layers/domain/entities/movie_entity.dart';

main() {
  test('A lista de filmes Populares deve ser igual a 20', () async {
    HttpService _httpService = DioHttpServiceImp();
    GetListMovieDataSource _getListMovieDataSource = GetListMovieRemoteDataSourceImp(_httpService);

    var result = await _getListMovieDataSource(MovieType.moviePopular);
    late List<MovieEntity> movies;
    result.fold(
      (error) => print(error.toString()),
      (success) => {
        movies = success,
      },
    );

    expect(movies.length, 20);
  });
}
