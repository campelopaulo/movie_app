import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/utils/future_state.dart';
import 'package:movies_app/layers/presentation/controllers/get_cast_by_id/get_cast_by_id_controller.dart';
import 'package:movies_app/layers/presentation/controllers/get_movie_by_id/get_movie_by_id_controller.dart';

class DetailMoviePage extends StatefulWidget {
  final int id;
  const DetailMoviePage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  var controllerMovieById = GetIt.I.get<GetMovieByIdController>();
  var controllerCastById = GetIt.I.get<GetCastByIdController>();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () {
      controllerMovieById.fetch(widget.id);
      controllerCastById.fetch(widget.id);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (controllerMovieById.futureState == FutureState.loading) {
          return const Scaffold(
            backgroundColor: Color.fromRGBO(21, 21, 29, 1),
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }

        if (controllerMovieById.futureState == FutureState.error) {
          return const Scaffold(
            backgroundColor: Color.fromRGBO(21, 21, 29, 1),
            body: Center(
              child: Text(
                'Ocorreu um erro.\n Tente novamente mais tarde.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }

        return Scaffold(
          backgroundColor: const Color.fromRGBO(21, 21, 29, 1),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        height: 349,
                        imageUrl: controllerMovieById.movie.imageUrl,
                        cacheKey: controllerMovieById.movie.imageUrl.trim(),
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(color: Colors.grey),
                        ),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                Color.fromRGBO(21, 21, 29, 0),
                                Color.fromRGBO(21, 21, 29, 0.3),
                                Color.fromRGBO(21, 21, 29, 0.6),
                                Color.fromRGBO(21, 21, 29, 0.9),
                                Color.fromRGBO(21, 21, 29, 1),
                              ],
                              stops: [
                                0.0,
                                0.25,
                                0.4,
                                0.75,
                                1.0,
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0, right: 20),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30.0),
                                        border: Border.all(color: Colors.black45, width: 4.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          color: Colors.black87,
                                        ),
                                        child: Center(
                                          child: Text(
                                            controllerMovieById.movie.voteAverage.toString(),
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: SizedBox(
                                        width: 56,
                                        height: 56,
                                        child: TweenAnimationBuilder<double>(
                                          tween: Tween<double>(begin: 0.0, end: controllerMovieById.movie.voteAverage / 10),
                                          duration: const Duration(milliseconds: 800),
                                          builder: (context, value, _) => CircularProgressIndicator(
                                            value: value,
                                            strokeWidth: 4,
                                            color: controllerMovieById.movie.voteAverage < 7.0 ? Colors.yellow : Colors.green,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controllerMovieById.movie.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      controllerMovieById.movie.releaseDate +
                                          '  ' +
                                          getTimeString(controllerMovieById.movie.duration),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                  child: Text(
                    controllerMovieById.movie.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 20, right: 30),
                  child: Text(
                    'Elenco Principal',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                Observer(
                  builder: (context) {
                    if (controllerCastById.futureState == FutureState.loading) {
                      return const Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }

                    if (controllerCastById.futureState == FutureState.error) {
                      return const Center(
                        child: Text(
                          'Ocorreu um erro.\n Tente novamente mais tarde.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return SizedBox(
                      height: 130,
                      child: ListView.builder(
                        itemCount: controllerCastById.cast.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding:
                                EdgeInsets.only(left: i == 0 ? 30 : 15, right: i == controllerCastById.cast.length - 1 ? 30 : 0),
                            child: Center(
                              child: SizedBox(
                                width: 60,
                                height: 100,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60.0),
                                        color: const Color.fromRGBO(48, 50, 67, 1),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: SizedBox(
                                              width: 60,
                                              height: 60,
                                              child: ClipOval(
                                                child: CachedNetworkImage(
                                                  imageUrl: controllerCastById.cast[i].imageUrl,
                                                  cacheKey: controllerCastById.cast[i].imageUrl.trim(),
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) => Image.asset("assets/cast.png"),
                                                  errorWidget: (context, url, error) => Image.asset("assets/cast.png"),
                                                ),
                                              ),
                                            ),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        controllerCastById.cast[i].name,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                  child: Text(
                    'Categoria(s)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    itemCount: controllerMovieById.movie.genres.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: i == 0 ? 30 : 15, right: i == controllerMovieById.movie.genres.length - 1 ? 30 : 0),
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: const Color.fromRGBO(48, 50, 67, 1),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                child: Text(
                                  controllerMovieById.movie.genres[i].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "0")}h${minutes.toString().padLeft(2, "0")}min';
  }
}
