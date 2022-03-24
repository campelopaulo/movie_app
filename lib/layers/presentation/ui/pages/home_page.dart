import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/layers/presentation/controllers/movie_popular/movie_popular_controller.dart';
import 'package:movies_app/layers/presentation/controllers/movie_top_rated/movie_top_rated_controller.dart';
import 'package:movies_app/layers/presentation/controllers/movie_up_coming/movie_up_coming_controller.dart';
import 'package:movies_app/layers/presentation/ui/widgets/list_movies_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controllerMoviePopular = GetIt.I.get<MoviePopularController>();
  var controllerMovieTopRated = GetIt.I.get<MovieTopRatedController>();
  var controllerMovieUpComing = GetIt.I.get<MovieUpComingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       backgroundColor: Colors.transparent,
      //       floating: false,
      //       pinned: false,
      //       expandedHeight: 240,
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: Image.network(
      //           'https://uploads.jovemnerd.com.br/wp-content/uploads/2021/11/homem-aranha-capa-2.jpg',
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      //     SliverFillRemaining(
      //       hasScrollBody: false,
      //       child: Column(
      //         children: [
      //           Observer(
      //             builder: (context) {
      //               return ListMoviesWidget(
      //                 titulo: 'Populares',
      //                 movies: controllerMoviePopular.movies,
      //                 futureState: controllerMoviePopular.futureState,
      //               );
      //             },
      //           ),
      //           Observer(
      //             builder: (context) {
      //               return ListMoviesWidget(
      //                 titulo: 'Mais bem avaliados',
      //                 movies: controllerMovieTopRated.movies,
      //                 futureState: controllerMovieTopRated.futureState,
      //               );
      //             },
      //           ),
      //           Observer(
      //             builder: (context) {
      //               return ListMoviesWidget(
      //                 titulo: 'Estreiam em breve',
      //                 movies: controllerMovieUpComing.movies,
      //                 futureState: controllerMovieUpComing.futureState,
      //               );
      //             },
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Observer(
                builder: (context) {
                  return ListMoviesWidget(
                    titulo: 'Populares',
                    movies: controllerMoviePopular.movies,
                    futureState: controllerMoviePopular.futureState,
                  );
                },
              ),
              Observer(
                builder: (context) {
                  return ListMoviesWidget(
                    titulo: 'Mais bem avaliados',
                    movies: controllerMovieTopRated.movies,
                    futureState: controllerMovieTopRated.futureState,
                  );
                },
              ),
              Observer(
                builder: (context) {
                  return ListMoviesWidget(
                    titulo: 'Estreiam em breve',
                    movies: controllerMovieUpComing.movies,
                    futureState: controllerMovieUpComing.futureState,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
