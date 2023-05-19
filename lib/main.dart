import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_torrents/apis.dart';
import 'package:top_torrents/home_screen.dart';
import 'package:top_torrents/models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: movies(1),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return HomeScreen(
                movies: snapshot.data!,
              );
            } else {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
          }),
    );
  }
}

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
