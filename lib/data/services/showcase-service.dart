import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seven_food/data/model/showcase-locations-model.dart';

import 'auth-service.dart';

const url = 'https://7food.kz/api/users/showcases';

class ShowCaseService {
  getToken() async {
    AuthService authService = AuthService();
    dynamic token = await authService.getToken();
    return token;
  }
  Future<List<LocationModel>> getShowCases() async {
    final response = await http.get(
      Uri.parse('$url'),
      headers: {
        "Content-Language": "ru",
        "Accept": "application/json",
        "Authorization": "Bearer " + await getToken(),
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return ShowcasesResponse.fromJson(jsonDecode(response.body)).data;
    } else {
      throw Exception('Error fetching locations');
    }
  }

  getShowCaseProducts(int id) async {
    final response = await http.get(
      Uri.parse('$url/$id/products'),
      headers: {
        "Content-Language": "ru",
        "Accept": "application/json",
        "Authorization": "Bearer " + await getToken(),
      },
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.body);
    }
  }
}