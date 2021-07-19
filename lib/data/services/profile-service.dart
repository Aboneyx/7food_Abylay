import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seven_food/data/model/profile-model.dart';

import 'auth-service.dart';

class ProfileService {
  getToken() async {
    AuthService authService = AuthService();
    dynamic token = await authService.getToken();
    return token;
  }

  Future<ProfileModel> getProfileInfo() async {
    final response = await http.get(
      Uri.parse('https://7food.kz/api/users/profile'),
      headers: {
        "Content-Language": "ru",
        "Accept": "application/json",
        "Authorization": "Bearer " + await getToken(),
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return ProfileResponse.fromJson(jsonDecode(response.body)).data;
    } else {
      throw Exception('Error fetching profile info');
    }
  }
}