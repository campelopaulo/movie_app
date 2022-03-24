import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/future_state.dart';
import 'package:movies_app/layers/domain/entities/movie_entity.dart';
import 'package:movies_app/layers/presentation/ui/components/movie_card.dart';

class ListMoviesWidget extends StatelessWidget {
  final String titulo;
  final List<MovieEntity> movies;
  final FutureState futureState;

  const ListMoviesWidget({
    Key? key,
    required this.titulo,
    required this.movies,
    required this.futureState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              titulo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: _loadWidget(),
        ),
        const SizedBox(height: 5),
      ],
    );
  }

  _loadWidget() {
    if (futureState == FutureState.loading) {
      return const Center(child: CircularProgressIndicator(color: Colors.grey));
    }

    if (futureState == FutureState.error) {
      return const Center(
        child: Text(
          'Ocorreu um erro.\n Tente novamente mais tarde.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return ListView.builder(
      itemCount: movies.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return MovieCard(
          id: movies[i].id,
          title: movies[i].title,
          posterUrl: movies[i].posterUrl,
          isFirst: i == 0,
          isLast: i == movies.length - 1,
        );
      },
    );
  }
}
