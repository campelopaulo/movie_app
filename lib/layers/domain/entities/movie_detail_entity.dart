import 'package:movies_app/layers/domain/entities/genre_movie_entity.dart';

class MovieDetailEntity {
  String title;
  String description;
  String imageUrl;
  String releaseDate;
  int duration;
  double voteAverage;
  List<GenreMovieEntity> genres;

  MovieDetailEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.releaseDate,
    required this.duration,
    required this.voteAverage,
    required this.genres,
  });
}
