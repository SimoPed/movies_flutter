import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}
