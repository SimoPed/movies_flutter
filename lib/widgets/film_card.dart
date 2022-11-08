import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget {
  final String name;
  final List<String> genres;
  final dynamic rating;
  final String image;
  final String summary;

  const FilmCard(
      {super.key, required this.name,
      required this.genres,
      required this.rating,
      required this.image,
      required this.summary});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.red,
      elevation: 20,
      shadowColor: Colors.black,
      child: SizedBox(
        width: 350,
        height: 150,
        child: Padding(
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
