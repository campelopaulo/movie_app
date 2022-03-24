import 'package:get_it/get_it.dart';
import 'package:movies_app/core/data/services/dio_http_service_impt.dart';
import 'package:movies_app/core/domain/services/http_service.dart';
import 'package:movies_app/layers/data/datasources/get_cast_by_id_datasource.dart';
import 'package:movies_app/layers/data/datasources/get_list_movie_datasource.dart';
import 'package:movies_app/layers/data/datasources/get_movie_by_id_datasource.dart';
import 'package:movies_app/layers/data/datasources/remote/get_cast_by_id_remote_datasource_imp.dart';
import 'package:movies_app/layers/data/datasources/remote/get_list_movie_remote_datasource_imp.dart';
import 'package:movies_app/layers/data/datasources/remote/get_movie_by_id_remote_datasource_imp.dart';
import 'package:movies_app/layers/data/repositories/get_cast_by_id_repository_imp.dart';
import 'package:movies_app/layers/data/repositories/get_list_movie_repository_imp.dart';
import 'package:movies_app/layers/data/repositories/get_movie_by_id_repository_imp.dart';
import 'package:movies_app/layers/domain/repositories/get_cast_by_id_repository.dart';
import 'package:movies_app/layers/domain/repositories/get_list_movie_repository.dart';
import 'package:movies_app/layers/domain/repositories/get_movie_by_id_repository.dart';
import 'package:movies_app/layers/domain/usecases/get_cast_by_id/get_cast_by_id_usecase.dart';
import 'package:movies_app/layers/domain/usecases/get_cast_by_id/get_cast_by_id_usecase_imp.dart';
import 'package:movies_app/layers/domain/usecases/get_list_movie/get_list_movie_usecase.dart';
import 'package:movies_app/layers/domain/usecases/get_list_movie/get_list_movie_usecase_imp.dart';
import 'package:movies_app/layers/domain/usecases/get_movie_by_id/get_movie_by_id_usecase.dart';
import 'package:movies_app/layers/domain/usecases/get_movie_by_id/get_movie_by_id_usecase_imp.dart';
import 'package:movies_app/layers/presentation/controllers/get_cast_by_id/get_cast_by_id_controller.dart';
import 'package:movies_app/layers/presentation/controllers/get_movie_by_id/get_movie_by_id_controller.dart';
import 'package:movies_app/layers/presentation/controllers/movie_popular/movie_popular_controller.dart';
import 'package:movies_app/layers/presentation/controllers/movie_top_rated/movie_top_rated_controller.dart';
import 'package:movies_app/layers/presentation/controllers/movie_up_coming/movie_up_coming_controller.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    // core
    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());

    //datasources
    getIt.registerLazySingleton<GetListMovieDataSource>(
      () => GetListMovieRemoteDataSourceImp(getIt()),
    );

    getIt.registerLazySingleton<GetMovieByIdDataSource>(
      () => GetMovieByIdRemoteDataSourceImp(getIt()),
    );

    getIt.registerLazySingleton<GetCastByIdDataSource>(
      () => GetCastByIdRemoteDataSourceImp(getIt()),
    );

    //repositories
    getIt.registerLazySingleton<GetListMovieRepository>(
      () => GetListMovieRepositoryImp(getIt()),
    );

    getIt.registerLazySingleton<GetMovieByIdRepository>(
      () => GetMovieByIdRepositoryImp(getIt()),
    );

    getIt.registerLazySingleton<GetCastByIdRepository>(
      () => GetCastByIdRepositoryImp(getIt()),
    );

    //usecases
    getIt.registerLazySingleton<GetListMovieUseCase>(
      () => GetListMovieUseCaseImp(getIt()),
    );

    getIt.registerLazySingleton<GetMovieByIdUseCase>(
      () => GetMovieByIdUseCaseImp(getIt()),
    );

    getIt.registerLazySingleton<GetCastByIdUseCase>(
      () => GetCastByIdUseCaseImp(getIt()),
    );

    //controllers
    getIt.registerFactory<MoviePopularController>(
      () => MoviePopularController(getIt()),
    );

    getIt.registerFactory<MovieTopRatedController>(
      () => MovieTopRatedController(getIt()),
    );

    getIt.registerFactory<MovieUpComingController>(
      () => MovieUpComingController(getIt()),
    );

    getIt.registerFactory<GetMovieByIdController>(
      () => GetMovieByIdController(getIt()),
    );

    getIt.registerFactory<GetCastByIdController>(
      () => GetCastByIdController(getIt()),
    );
  }
}
