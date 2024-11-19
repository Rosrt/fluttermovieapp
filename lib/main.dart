// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemrograman_mobile_43a87006200203/custom_style.dart';
import 'package:pemrograman_mobile_43a87006200203/screens/home_screen.dart';
import 'package:pemrograman_mobile_43a87006200203/screens/list_movie.dart';
import 'package:pemrograman_mobile_43a87006200203/screens/login_screen.dart';
import 'package:pemrograman_mobile_43a87006200203/screens/upcoming.dart';

void main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final List<Widget> screens = [
    HomeScreen(),
    MovieScreen(),
    UpcomingScreen(),
    LoginScreen(),
  ];
  var screenIndex = 0.obs;

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter rest api",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.scaffoldBgColor,
        useMaterial3: true,
      ),
      home: Obx(() => Scaffold(
            body: Center(
              child: screens[screenIndex.value],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up),
                  label: "Top Rated",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: "Upcoming",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
              selectedItemColor: Colours.ratingColor, // Set dynamic color
              unselectedItemColor: Colors.white, // Set unselected color
              currentIndex: screenIndex.value, // Tambahkan baris ini
              onTap: (value) {
                screenIndex.value = value;
              },
            ),
          )),
    );
  }
}
