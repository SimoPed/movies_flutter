import 'dart:async';
import 'package:movies_flutter/response/list_movies_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MoviesBloc {

  Future<List<ListMoviesResponse>> getMovies() async {
    var url = Uri.parse('https://api.tvmaze.com/shows');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<ListMoviesResponse> responseMap = convert.jsonDecode(response.body);
      List _temp = [];

      for(var element in responseMap) {
        _temp.add(element);
      }
      return ListMoviesResponse.contentsFromSnapshot(_temp);
    } else {
      throw Exception('Something went wrong');
    }
  }
}
