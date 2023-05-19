import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:top_torrents/apis.dart';
import 'package:top_torrents/home_screen.dart';

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
