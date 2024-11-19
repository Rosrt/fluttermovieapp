// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemrograman_mobile_43a87006200203/controller/movie_controller.dart';
import 'package:pemrograman_mobile_43a87006200203/models/movie.dart';
import 'package:pemrograman_mobile_43a87006200203/screens/detail_screen.dart';

import '../custom_style.dart';
import '../constans.dart';

class MovieScreen extends StatelessWidget {
  MovieScreen({Key? key}) : super(key: key);

  final MovieController controller = Get.put(MovieController());
  final proppinBold = Fonts.poppins.copyWith(
    fontSize: 20.0, // Sesuaikan dengan ukuran yang diinginkan
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Top Rated",
          style: proppinBold,
        ),
        centerTitle: true,
        backgroundColor: Colours.scaffoldBgColor,
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: .7,
                mainAxisExtent: 250,
              ),
              itemCount: controller.movies.length,
              itemBuilder: (context, index) {
                final movie = controller.movies[index];
                return InkWell(
                  onTap: () {
                    _showDetailPopup(context, movie);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Image.network(
                            '${Constants.imagePath}${movie.posterPath}',
                            width: double.infinity,
                            height: 180,
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
    );
  }
// MovieScreen.dart

  void _showDetailPopup(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(movie: movie),
      ),
    );
  }
}
