import 'package:flutter/material.dart';
import 'package:movies_flutter/movies/movies_bloc.dart';
import 'package:movies_flutter/response/list_movies_response.dart';
import 'package:movies_flutter/widgets/film_card.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({super.key, required this.title});

  final String title;

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {
  final MoviesBloc _moviesBloc = MoviesBloc();
  late List<ListMoviesResponse> _listMovies;

  @override
  void initState() {
    super.initState();

      retrieveMovies();
  }

  Future<void> retrieveMovies() async {
    _listMovies = await _moviesBloc.getMovies();

    print(_listMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FilmCard(
                name: 'Ciao',
                genres: ['drama', 'fantasy'],
                rating: 25,
                image: 'image',
                summary: 'summary'
            )
          ],
        ),
      ),
    );
  }
}
