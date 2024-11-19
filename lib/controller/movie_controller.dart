// ignore_for_file: avoid_print, must_call_super, non_constant_identifier_names

import 'dart:convert';

import 'package:pemrograman_mobile_43a87006200203/models/movie.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pemrograman_mobile_43a87006200203/screens/detail_screen.dart';

class MovieController extends GetxController {
  var isLoading = false.obs;
  var page = 1;
  final String url =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=791cffe59d593a0b6117d2d0d40e8970';
  RxList<Movie> movies = <Movie>[].obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchMovies();
  }

  Future<void> fetchMovies() async {
    isLoading(true);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);

        movies.assignAll(
            List<Movie>.from(data['results'].map((x) => Movie.fromJson(x))));
      }
    } catch (error) {
      print("Error fetching movies: $error");
    } finally {
      isLoading(false);
    }
  }

  void goToDetail(Movie movie) {
    Get.to(() => DetailScreen(movie: movie));
  }
}
