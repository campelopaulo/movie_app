import 'package:movies_app/core/utils/helper_api.dart';
import 'package:movies_app/layers/domain/entities/cast_movie_entity.dart';

extension CastMovieDto on CastMovieEntity {
  static CastMovieEntity fromJson(Map json) {
    return CastMovieEntity(
      id: json['id'] as int,
      name: json['name'],
      imageUrl: HelperApi.URL_IMAGE_API(json['profile_path']),
    );
  }
}
