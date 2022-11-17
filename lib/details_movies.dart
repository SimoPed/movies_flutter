import 'package:flutter/material.dart';
import 'package:movies_flutter/movies/movie_details.dart';
import 'package:movies_flutter/response/list_movies_response.dart';

class DetailsMovies extends StatefulWidget {
  const DetailsMovies({super.key, required this.title, required this.id});

  static const route = "/details";

  final String title;
  final int id;

  @override
  State<DetailsMovies> createState() => _DetailsMoviesState();
}

class _DetailsMoviesState extends State<DetailsMovies> {
  final MovieDetails _movieDetails = MovieDetails();
  late Future<ListMoviesResponse> _details;

  @override
  void initState() {
    super.initState();

    _details = _movieDetails.getDetailMovie(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    // final id = ModalRoute.of(context)!.settings.arguments as ListMoviesResponse;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<ListMoviesResponse>(
        future: _details,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(snapshot.data!.originalImage),
                          fit: BoxFit.cover)),
                  // child: Image.network(
                  // snapshot.data!.originalImage,
                  //   fit: BoxFit.cover,
                  //   height: MediaQuery.of(context).size.height,
                  //   width: MediaQuery.of(context).size.width,
                  // ),
                ),
                Text(snapshot.data!.name),
                Text(snapshot.data!.genres.toString()),
                Text(snapshot.data!.rating.toString()),
                Text(snapshot.data!.summary),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
