// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class HelperApi {
  static const URL_API = 'https://api.themoviedb.org/3/';

  static const URL_MOVIES_POPULAR_API = 'movie/popular?language=pt-BR&page=1';
  static const URL_MOVIES_TOP_RATED_API = 'movie/top_rated?language=pt-BR&page=1&region=BR';
  static const URL_MOVIES_UP_COMING_API = 'movie/upcoming?language=pt-BR';

  static String URL_IMAGE_API(String caminho) => 'https://image.tmdb.org/t/p/w500$caminho';
  static String URL_IMAGE_ORIGINAL_API(String caminho) => 'https://image.tmdb.org/t/p/original$caminho';
  static String URL_MOVIE_DETAIL_API(int id) => 'movie/$id?language=pt-BR';
  static String URL_CAST_MOVIE_API(int id) => 'movie/$id/credits?language=pt-BR';
}
