import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/core/data/services/dio_http_service_impt.dart';
import 'package:movies_app/core/domain/services/http_service.dart';
import 'package:movies_app/layers/data/datasources/get_cast_by_id_datasource.dart';
import 'package:movies_app/layers/data/datasources/remote/get_cast_by_id_remote_datasource_imp.dart';
import 'package:movies_app/layers/domain/entities/cast_movie_entity.dart';

main() {
  test('Cast do filme do homem aranha', () async {
    HttpService _httpService = DioHttpServiceImp();

    GetCastByIdDataSource _getCastByIdDataSource = GetCastByIdRemoteDataSourceImp(_httpService);

    var result = await _getCastByIdDataSource(634649);
    late List<CastMovieEntity> cast;

    result.fold(
      (error) => print(error.toString()),
      (success) => {
        cast = success,
      },
    );

    expect(cast[0].name, 'Tom Holland');
  });
}
