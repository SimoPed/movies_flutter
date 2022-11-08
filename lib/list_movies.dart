import 'package:flutter/material.dart';
import 'package:movies_flutter/movies/movies_bloc.dart';
import 'package:movies_flutter/response/list_movies_response.dart';
import 'package:movies_flutter/response/movies_page_state.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({super.key, required this.title});

  final String title;

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {
  final MoviesBloc _moviesBloc = MoviesBloc();

  @override
  void initState() {
    _moviesBloc.retrieveMovies();
    super.initState();
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
            Card(
              color: Colors.red,
              elevation: 20,
              shadowColor: Colors.black,
              child: SizedBox(
                width: 350,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: StreamBuilder<MoviesPageState>(
                    stream: _moviesBloc.pageState?.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.name);
                      } else if(snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
