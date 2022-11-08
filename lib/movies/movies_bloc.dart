import 'dart:async';
import 'package:movies_flutter/response/list_movies_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:movies_flutter/response/movies_page_state.dart';

class MoviesBloc {

  StreamController<ListMoviesResponse>? pageState = StreamController.broadcast();

  List<MoviesPageState> _movies = List.empty();
  int _index = 0;

  retrieveMovies() async {
    if (_movies.isEmpty) {
      _movies = (await getMovies()) as List<MoviesPageState>;
    }
    pageState?.add(
        ListMoviesResponse(
            name: _movies[_index].name,
            summary: _movies[_index].summary,
            image: _movies[_index].image,
            rating: _movies[_index].rating)
    );
  }

  Future<ListMoviesResponse> getMovies() async {
    var url = Uri.parse('https://api.tvmaze.com/shows');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseMap = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return ListMoviesResponse.fromJson(responseMap);
    } else {
      throw Exception('Something went wrong');
    }
  }

  dispose() {
    pageState?.close();
  }
}
