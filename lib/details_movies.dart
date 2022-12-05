import 'package:flutter/material.dart';
import 'package:movies_flutter/movies/movie_details.dart';
import 'package:movies_flutter/response/movie_details_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late Future<MovieDetailsResponse> _details;
  late bool liked = false;
  static const likedKey = 'liked_key';

  @override
  void initState() {
    super.initState();

    _details = _movieDetails.getDetailMovie(id: widget.id);
    _restorePersistencePreferences();
  }

  void _restorePersistencePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    var liked = prefs.getBool(likedKey);
    setState(() => this.liked = liked!);
}

  _persistencePreferences(id) async {
    setState(() => liked = !liked);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(likedKey, liked);
    var idMovies = prefs.setInt('id_movie', id);
    print(idMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<MovieDetailsResponse>(
          future: _details,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.network(
                      snapshot.data!.originalImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () => {_persistencePreferences(snapshot.data!.id)},
                            icon: liked ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                            color: liked ? Colors.red : Colors.white),
                      ],
                    ),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/images/starIcon.png',
                                        width: 15,
                                        height: 15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                            snapshot.data!.rating.toString(),
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white)),
                                      ),
                                    ],
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
                                    padding: const EdgeInsets.all(4),
                                    child: Text(snapshot.data!.status,
                                      style: const TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white),),
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
                                      style:
                                          const TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
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
