// upcoming_screen.dart GetxController & Screen dalam 1 file

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pemrograman_mobile_43a87006200203/models/movie.dart';

import '../custom_style.dart';

class UpcomingController extends GetxController {
  var upcomingMovies = <Movie>[].obs;

  @override
  void onInit() {
    fetchDataFromApi();
    super.onInit();
  }

  Future<void> fetchDataFromApi() async {
    final apiKey =
        '791cffe59d593a0b6117d2d0d40e8970'; // Replace with your actual API key
    final url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> results = responseData['results'];

        upcomingMovies.assignAll(results.map((movieData) {
          return Movie.fromJson(movieData);
        }).toList());
      } else {
        throw Exception('Failed to load upcoming movies');
      }
    } catch (error) {
      print('Error fetching upcoming movies: $error');
    }
  }
}

class UpcomingScreen extends StatelessWidget {
  final UpcomingController upcomingController = Get.put(UpcomingController());
  final proppinBold = Fonts.poppins.copyWith(
    fontSize: 20.0, // Sesuaikan dengan ukuran yang diinginkan
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upcoming Movies",
          style: proppinBold,
        ),
        centerTitle: true,
        backgroundColor: Colours.scaffoldBgColor,
      ),
      body: Obx(
        () {
          if (upcomingController.upcomingMovies.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: upcomingController.upcomingMovies.length,
              itemBuilder: (context, index) {
                final movie = upcomingController.upcomingMovies[index];
                final formattedReleaseDate = DateFormat('d-MM-y')
                    .format(DateTime.parse(movie.releaseDate));

                return ListTile(
                  title: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 15, // Sesuaikan dengan ukuran yang diinginkan
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Text("Release Date: $formattedReleaseDate"),
                      SizedBox(height: 4),
                      Text("Vote Average: ${movie.voteAverage}"),
                    ],
                  ),
                  leading: Container(
                    width: 80,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${movie.backDropPath}',
                        ),
                      ),
                    ),
                  ),
                  // Add more details as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
