import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget {
  final String name;
  final String genres;
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
      width: 400,
      height: 150,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(image,
                fit: BoxFit.cover,
              ),
            ),
              SizedBox(
                width: 250,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 1, top: 1, right: 1, bottom: 0.5),
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(genres[0],),
                    Align(
                      alignment: FractionalOffset.center,
                      child: Text(summary, maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Text(rating.toString(),
                        style: const TextStyle(
                          fontSize: 12
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
