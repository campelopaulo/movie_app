import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/layers/presentation/ui/pages/detail_movie_page.dart';

class MovieCard extends StatelessWidget {
  final int id;
  final String title;
  final String posterUrl;
  final bool isLast;
  final bool isFirst;

  const MovieCard({
    Key? key,
    required this.id,
    required this.title,
    required this.posterUrl,
    required this.isLast,
    required this.isFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isFirst ? 20 : 0, right: isLast ? 20 : 8),
      child: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailMoviePage(
                  id: id,
                ),
              ),
            );
          },
          child: SizedBox(
            width: 120,
            height: 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                imageUrl: posterUrl,
                cacheKey: title.trim(),
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
