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
    double widthScreen = MediaQuery.of(context).size.width;

    return Container(
      width: widthScreen * 0.9,
      height: 150,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: widthScreen * 0.55,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 1, top: 1, right: 1, bottom: 0.5),
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      genres,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black, fontStyle: FontStyle.italic),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 10, right: 0.8, bottom: 15),
                    child: Align(
                      alignment: FractionalOffset.center,
                      child: Text(
                        summary,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 1, top: 0, right: 0, bottom: 0),
                        child: Align(
                            alignment: FractionalOffset.bottomRight,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/starIcon.png',
                                  width: 15,
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(rating.toString(),
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black)),
                                ),
                              ],
                            )),
                      ),
                    ],
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
