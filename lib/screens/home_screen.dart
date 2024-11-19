// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:pemrograman_mobile_43a87006200203/api/api.dart';
import 'package:pemrograman_mobile_43a87006200203/models/movie.dart';

import '../custom_style.dart';
import '/widgets/movie_slider.dart';
import '/widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Movie>>? trendingMovies;
  Future<List<Movie>>? topRatedMovies;
  Future<List<Movie>>? upcomingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    final aBeeZeeStyle = Fonts.aBeeZee.copyWith(
      fontSize: 25,
    );
    final mwStyle = Fonts.merriweather.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: Colors.redAccent,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'FILMOVIE',
          style: mwStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TRENDING
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Trending movies',
                  style: aBeeZeeStyle,
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingSlider(snapshot: snapshot);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(height: 32),
              // TOP RATED
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Top rated movies',
                  style: aBeeZeeStyle,
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieSlider(snapshot: snapshot);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              SizedBox(height: 32),
              // UPCOMING
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Upcoming movies',
                  style: aBeeZeeStyle,
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MovieSlider(snapshot: snapshot);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
