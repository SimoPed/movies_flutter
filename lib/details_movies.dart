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
      body: Center(
        child: Image.network(id.image),
      ),
    );
  }
}
