import 'dart:async';
import 'package:movies_flutter/response/list_movies_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DetailsBloc {

  Future<ListMoviesResponse> getDetailsMovie() async {
    var url = Uri.parse('https://api.tvmaze.com/shows/${id}');
  }

}