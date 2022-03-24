import 'package:movies_app/core/utils/helper_api.dart';
import 'package:movies_app/layers/domain/entities/movie_entity.dart';

extension MovieDto on MovieEntity {
  static MovieEntity fromJson(Map json) {
    return MovieEntity(
      id: json['id'] as int,
      title: json['title'],
      posterUrl: HelperApi.URL_IMAGE_API(json['poster_path']),
      backdropUrl: HelperApi.URL_IMAGE_API(json['backdrop_path']),
    );
  }

  Map toJson() {
    return {
      'id': id,
      'name': title,
      'poster_path': posterUrl,
      'backdrop_path': backdropUrl,
    };
  }
}
