import 'package:movies_app/layers/domain/entities/genre_movie_entity.dart';

extension GenreMovieDto on GenreMovieEntity {
  static GenreMovieEntity fromJson(Map json) {
    return GenreMovieEntity(
      id: json['id'] as int,
      name: json['name'],
    );
  }
}
