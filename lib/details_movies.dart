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
      body: Center(
        child: FutureBuilder<ListMoviesResponse>(
          future: _details,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        snapshot.data!.originalImage,
                        fit: BoxFit.cover,
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black38,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data!.name,
                                          style: const TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 50,
                                            top: 0.5,
                                            right: 0.5,
                                            bottom: 0.5),
                                        decoration: const BoxDecoration(
                                            //     borderRadius: BorderRadius.circular(10),
                                            //     color: Colors.green,
                                            image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/starIcon.png'),
                                        )),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                          child: Text(
                                            snapshot.data!.rating.toString(),
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        // Image.asset('assets/images/starIcon.png', width: 10, height: 10,)
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          snapshot.data!.genres
                                              .toString()
                                              .replaceAll('[', '')
                                              .replaceAll(']', ''),
                                          style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            snapshot.data!.summary
                                                .replaceAll('<b>', '')
                                                .replaceAll('</b>', '')
                                                .replaceAll('<p>', '')
                                                .replaceAll('</p>', '')
                                                .replaceAll('<i>', '')
                                                .replaceAll('</i>', ''),
                                            style: const TextStyle(
                                                color: Colors.white), textAlign: TextAlign.center,),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
