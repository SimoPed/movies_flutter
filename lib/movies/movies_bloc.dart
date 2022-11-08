import 'dart:async';
import 'package:movies_flutter/response/list_movies_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MoviesBloc {

  Future<List<ListMoviesResponse>> getMovies() async {
    var url = Uri.parse('https://api.tvmaze.com/shows');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> responseMap = convert.jsonDecode(response.body);
      List<Map<String, dynamic>> jsonList = [];
      for(var element in responseMap) {
        jsonList.add(element);
      }
      return ListMoviesResponse.contentsFromSnapshot(jsonList);
    } else {
      throw Exception('Something went wrong');
    }
  }
}
