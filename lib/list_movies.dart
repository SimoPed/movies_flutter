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
  late Future<List<ListMoviesResponse>> _listMovies;

  @override
  void initState() {
    super.initState();

    _listMovies = _moviesBloc.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: FutureBuilder<List<ListMoviesResponse>>(
              future: _listMovies,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return FilmCard(
                          name: snapshot.data![index].name,
                          genres: snapshot.data![index].genres,
                          rating: snapshot.data![index].rating,
                          image: snapshot.data![index].image,
                          summary: snapshot.data![index].summary.replaceAll('<b>', '').replaceAll('</b>', '').replaceAll('<p>', '')
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        );
  }
}
