import 'package:movies_flutter/response/list_movies_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MoviesBloc {
  //vedere come si fa a chiamare tutto insieme
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
}
