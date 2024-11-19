import 'dart:convert';

import 'package:pemrograman_mobile_43a87006200203/constans.dart';
import 'package:pemrograman_mobile_43a87006200203/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl = 'https://api.tvmaze.com/search/shows?q=all';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
