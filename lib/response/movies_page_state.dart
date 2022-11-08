import 'package:movies_flutter/response/list_movies_response.dart';

class MoviesPageState {
  final String? name;
  final String? summary;
  final Image? image;
  final Rating? rating;

  MoviesPageState(
      {required this.name,
      required this.summary,
      required this.image,
      required this.rating});
}
