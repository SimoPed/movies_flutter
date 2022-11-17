import 'package:movies_flutter/details_movies.dart';
import 'package:movies_flutter/movies/movies_bloc.dart';
import 'package:movies_flutter/response/list_movies_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';

class MovieDetails {

  Future<ListMoviesResponse> getDetailMovie({id}) async {
    var url = Uri.parse('https://api.tvmaze.com/shows/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return ListMoviesResponse.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception('Something went wrong');
    }
  }
}
