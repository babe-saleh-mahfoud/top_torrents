import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          Text(movie.title,
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: GoogleFonts.praise().fontFamily,
                fontWeight: FontWeight.bold,
              )),
          Text(movie.year.toString()),
          Text(movie.rating.toString()),
          Text(movie.runtime.toString()),
          Text(movie.descriptionFull),
        ],
      ),
    );
  }
}
