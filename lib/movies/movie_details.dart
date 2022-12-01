import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:async';
import '../response/movie_details_response.dart';

class MovieDetails {

  Future<MovieDetailsResponse> getDetailMovie({id}) async {
    var url = Uri.parse('https://api.tvmaze.com/shows/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return MovieDetailsResponse.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception('Something went wrong');
    }
  }
}
