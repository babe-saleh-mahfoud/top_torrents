import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_torrents/apis.dart';
import 'package:top_torrents/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.movies});
  final List<Movie> movies;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> _movies = [];
  final ScrollController _scrollController = ScrollController();
  int _page = 2;
  @override
  void initState() {
    _movies.addAll(widget.movies);
    _scrollController.addListener(() async {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // You're at the top.
        } else {
          _movies.addAll(await movies(_page++));
          setState(() {
            _movies = _movies;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Top Torrents'),
          centerTitle: true,
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: _movies.length,
          itemBuilder: (context, index) {
            final Movie movie = _movies[index];
            return MovieCard(movie: movie);
          },
        ));
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Clipboard.setData(const ClipboardData(text: "your text"));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
        child: ListTile(
          tileColor: Colors.blue.withOpacity(0.1),
          leading: Image.network(movie.largeCoverImage),
          title: Text(movie.title),
          subtitle: Text(movie.year.toString()),
          trailing: Text(movie.rating.toString()),
        ),
      ),
    );
  }
}
