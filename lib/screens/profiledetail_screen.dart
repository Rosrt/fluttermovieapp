// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Detail"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headerImage,
            SizedBox(height: 20),
            informationContainer,
            SizedBox(height: 20),
            backButtonContainer(context),
          ],
        ),
      ),
    );
  }
}

final headerImage = Container(
  width: double.infinity,
  height: 300,
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/background.jpg'),
      fit: BoxFit.cover,
    ),
  ),
  child: Container(
    margin: const EdgeInsets.only(top: 44),
    child: Column(
      children: [
        CircleAvatar(
          radius: 64,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        SizedBox(height: 12),
        Text(
          'Ganes Yudha Kusuma',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Software Developer',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlueAccent,
          ),
        ),
      ],
    ),
  ),
);

final informationContainer = Container(
  padding: EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Icon(Icons.person),
          SizedBox(width: 10),
          Text("Ganes Yudha Kusuma"),
        ],
      ),
      SizedBox(height: 10),
      Row(
        children: [
          Icon(Icons.email),
          SizedBox(width: 10),
          Text("examplemail@mail"),
        ],
      ),
      SizedBox(height: 10),
      Row(
        children: [
          Icon(Icons.work),
          SizedBox(width: 10),
          Text("Software Developer"),
        ],
      ),
      SizedBox(height: 10),
      Row(
        children: [
          Icon(Icons.phone),
          SizedBox(width: 10),
          Text("0812 3456 7890"),
        ],
      ),
      SizedBox(height: 10),
      Row(
        children: [
          Icon(Icons.diamond),
          SizedBox(width: 10),
          Text("Premium Member"),
        ],
      ),
    ],
  ),
);

Widget backButtonContainer(BuildContext context) {
  // Menggunakan parameter context
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("Kembali ke Home"),
    ),
  );
}
