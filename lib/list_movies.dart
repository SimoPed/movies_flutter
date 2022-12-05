import 'package:flutter/material.dart';
import 'package:movies_flutter/animations/animation_page_route.dart';
import 'package:movies_flutter/movies/movies_bloc.dart';
import 'package:movies_flutter/response/list_movies_response.dart';
import 'package:movies_flutter/widgets/film_card.dart';
import 'details_movies.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({super.key, required this.title});

  static const route = "/home";

  final String title;

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies>
    with SingleTickerProviderStateMixin {
  final MoviesBloc _moviesBloc = MoviesBloc();
  late Future<List<ListMoviesResponse>> _listMovies;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    controller.addListener(() {
      setState(() {});
    });

    _listMovies = _moviesBloc.getMovies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          AnimationPageRoute(
                              widget: DetailsMovies(
                                  title: snapshot.data![index].name,
                                  id: snapshot.data![index].id))
                          );
                    },
                    child: FilmCard(
                        name: snapshot.data![index].name,
                        genres: snapshot.data![index].genres
                            .replaceAll('[', '')
                            .replaceAll(']', ''),
                        rating: snapshot.data![index].rating,
                        image: snapshot.data![index].mediumImage,
                        summary: snapshot.data![index].summary
                            .replaceAll('<b>', '')
                            .replaceAll('</b>', '')
                            .replaceAll('<p>', '')
                            .replaceAll('<i>', '')
                            .replaceAll('</i>', '')),
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
