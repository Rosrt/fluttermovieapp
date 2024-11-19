// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pemrograman_mobile_43a87006200203/custom_style.dart';
import 'package:pemrograman_mobile_43a87006200203/constans.dart';
import 'package:pemrograman_mobile_43a87006200203/models/movie.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.movie,
  });
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    // Mengambil custom font dan memberi style tambahan
    final bellezaStyle = Fonts.belleza.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
    final openSansStyle = Fonts.openSans.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w800,
    );
    final robotoStyle = Fonts.roboto.copyWith(
      fontSize: 25,
      fontWeight: FontWeight.w400,
    );
    final robotoMed = Fonts.roboto.copyWith(
      fontSize: 17,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(top: 8, left: 8),
              decoration: BoxDecoration(
                color: Colours.scaffoldBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                ),
              ),
            ),
            backgroundColor: const Color.fromRGBO(35, 39, 46, 1),
            expandedHeight: 200,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: bellezaStyle,
              ),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: Image.network(
                  '${Constants.imagePath}${movie.backDropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //OVERVIEW
                  Text(
                    'Overview',
                    style: openSansStyle,
                  ),
                  RichText(
                    text: TextSpan(
                      style: robotoStyle,
                      children: [
                        TextSpan(text: movie.overview),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    //BOTTOM SIZEBOX
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //RELEASE DATE
                              Text(
                                'Release date: ',
                                style: robotoMed,
                              ),
                              Text(
                                movie.releaseDate,
                                style: robotoMed,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              //RATING
                              Text(
                                'Rating: ',
                                style: robotoMed,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text('${movie.voteAverage.toStringAsFixed(1)}/10')
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
