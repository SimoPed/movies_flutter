import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget {
  final String name;
  final List<String> genres;
  final dynamic rating;
  final String image;
  final String summary;

  const FilmCard(
      {super.key,
      required this.name,
      required this.genres,
      required this.rating,
      required this.image,
      required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10)
      ),
      child: SizedBox(
        width: 400,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Text(image, style: const TextStyle(
              fontSize: 20,
            ), textAlign: TextAlign.start,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(name, style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ), textAlign: TextAlign.center,
                  ),
                  Text(genres[0]),
                  Text(summary),
                  Text(rating.toString())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
