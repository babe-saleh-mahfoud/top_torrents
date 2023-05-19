import 'dart:convert';

import 'package:top_torrents/models.dart';
import 'package:http/http.dart' as http;

Future<List<Movie>> movies(int pages) async {
  print('fetching movies');
  try {
    final response = await http.get(
      Uri.parse(
        'https://yts.mx/api/v2/list_movies.json?minimum_rating=6&quality=2160p&limit=15&page=$pages',
      ),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> movies = data['data']['movies'];
      return movies.map((json) => Movie.fromJson(json)).toList();
    } else {
      print('Failed to load movies');

      print(response.statusCode);
      return [];
    }
  } catch (e) {
    print(e);
    throw Exception('Failed to load movies');
  }
}
