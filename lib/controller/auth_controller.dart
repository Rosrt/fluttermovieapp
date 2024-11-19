// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthController extends GetxController {
//   final url =
//       'https://api.themoviedb.org/3/discover/movie?api_key=791cffe59d593a0b6117d2d0d40e8970';
//   var isLoading = false.obs;
//   var isLoggedin = false.obs;
//   var message = "".obs;

//   login(Map<String, dynamic> payload) async {
//     isLoading(true);
//     message("");
//     final response = await http.post(Uri.parse('$url/login'),
//         body: jsonEncode(payload),
//         headers: {'Content-Type': "application/json"});

//     final data = jsonDecode(response.body);
//     if (response.statusCode == 200) {
//       final accessToken = data['access_token'];
//       final pref = await SharedPreferences.getInstance();
//       await pref.setString("access_token", accessToken);
//       await pref.setString("user", jsonEncode(data['user']));
//       isLoggedin(true);
//     } else if (response.statusCode == 422) {
//       final errors = data['errors'];
//       final error = errors[0];
//       message(error['msg']);
//       isLoggedin(false);
//     }
//     isLoading(false);
//   }

//   logout(Map<String, dynamic> payload) async {
//     final pref = await SharedPreferences.getInstance();
//     pref.clear();
//     isLoading(true);
//     message("");

//     isLoading(false);
//   }
// }
