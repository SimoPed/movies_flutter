import 'dart:async';
import 'package:movies_flutter/response/list_movies_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MoviesBloc {

  Future<List<ListMoviesResponse>> getMovies() async {
    var url = Uri.parse('https://api.tvmaze.com/shows');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var responseMap = convert.jsonDecode(response.body);
      List<ListMoviesResponse> moviesList = [];

      for (var element in responseMap) {
        ListMoviesResponse list = ListMoviesResponse(
            id: element['id'],
            name: element['name'],
            genres: element['genres'],
            rating: element['rating'],
            image: element['image'],
            summary: element['summary']);
        moviesList.add(list);
      }
      return moviesList;
    } else {
      throw Exception('Something went wrong');
    }
  }
}
