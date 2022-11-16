import 'package:flutter/material.dart';
import 'package:movies_flutter/details_movies.dart';
import 'package:movies_flutter/list_movies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListMovies(title: 'Movies'),
      routes: {
        ListMovies.route: (context) => const ListMovies(title: 'Movies'),
        DetailsMovies.route: (context) => const DetailsMovies(title: 'Details')
      },
      initialRoute: ListMovies.route,
    );
  }
}

