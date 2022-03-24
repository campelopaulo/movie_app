import 'package:movies_app/core/utils/helper_api.dart';
import 'package:movies_app/layers/data/dtos/genre_movie_dto.dart';
import 'package:movies_app/layers/domain/entities/movie_detail_entity.dart';

extension MovieDetailDto on MovieDetailEntity {
  static MovieDetailEntity fromJson(Map json) {
    return MovieDetailEntity(
      title: json['title'],
      description: json['overview'],
      imageUrl: HelperApi.URL_IMAGE_ORIGINAL_API(json['backdrop_path']),
      releaseDate: json['release_date'],
      duration: json['runtime'],
      voteAverage: json['vote_average'],
      genres: List.from(json['genres']).map((e) => GenreMovieDto.fromJson(e)).toList(),
    );
  }
}
