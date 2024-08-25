import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:jewelry_custom_flutter/model/user_model.dart';

Future<User> fetchUserData() async {
  final response = await http.get(Uri.parse('https://ocha-developers-lab.online/user'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return User.fromJson(data);
  } else {
    throw Exception('Failed to load user data');
  }
}
