import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/core/data/services/dio_http_service_impt.dart';
import 'package:movies_app/core/domain/services/http_service.dart';
import 'package:movies_app/layers/data/datasources/get_movie_by_id_datasource.dart';
import 'package:movies_app/layers/data/datasources/remote/get_movie_by_id_remote_datasource_imp.dart';
import 'package:movies_app/layers/domain/entities/movie_detail_entity.dart';

main() {
  test('Detalhes do filme do homem aranha', () async {
    HttpService _httpService = DioHttpServiceImp();

    GetMovieByIdDataSource _getMovieByIdDataSource = GetMovieByIdRemoteDataSourceImp(_httpService);
    var result = await _getMovieByIdDataSource(634649);
    late MovieDetailEntity movie;

    result.fold(
      (error) => print(error.toString()),
      (success) => {
        movie = success,
      },
    );

    expect(movie.title, 'Homem-Aranha: Sem Volta Para Casa');
  });
}
