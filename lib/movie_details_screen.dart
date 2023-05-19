import 'package:flutter/material.dart';
import 'package:top_torrents/models.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Image.network(movie.largeCoverImage),
          Text(movie.title),
          Text(movie.year.toString()),
          Text(movie.rating.toString()),
          Text(movie.runtime.toString()),
          Text(movie.descriptionFull),
        ],
      ),
    );
  }
}
