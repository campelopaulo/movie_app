import 'package:flutter_test/flutter_test.dart';
import 'package:movies_app/layers/domain/entities/movie_entity.dart';

main() {
  test('Espero que a entidade não seja nula', () {
    MovieEntity movieEntitty = MovieEntity(id: 1, title: 'Teste', posterUrl: 'teste', backdropUrl: 'teste');
    expect(movieEntitty, isNotNull);
  });
}
