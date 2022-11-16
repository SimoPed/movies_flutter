import 'package:flutter/material.dart';
import 'package:movies_flutter/response/list_movies_response.dart';

class DetailsMovies extends StatefulWidget {
  const DetailsMovies({super.key, required this.title});

  static const route = "/details";

  final String title;

  @override
  State<DetailsMovies> createState() => _DetailsMoviesState();
}

class _DetailsMoviesState extends State<DetailsMovies> {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as ListMoviesResponse;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
        ),
        child: Stack(children: [
          Image.network(
            id.originalImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 60, right: 1, bottom: 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  id.genres.replaceAll('[', '').replaceAll(']', ''),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                id.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, top: 1, right: 1, bottom: 1),
                  child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, top: 0.5, right: 5, bottom: 0.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/starIcon.png',
                              ))),
                      child: Text(id.rating.toString()))
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 1, right: 10, bottom: 40),
                child: Text(
                  id.summary
                      .replaceAll('<b>', '')
                      .replaceAll('</b>', '')
                      .replaceAll('<p>', '')
                      .replaceAll('</p>', ''),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
