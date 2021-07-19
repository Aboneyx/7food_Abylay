import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seven_food/data/model/history-model.dart';
import 'package:seven_food/data/services/auth-service.dart';

const url = 'https://7food.kz/api/users/histories';

class HistoryService {
  getToken() async {
    AuthService authService = AuthService();
    dynamic token = await authService.getToken();
    return token;
  }
  Future<HistoryResponse> getHistories() async {
    final response = await http.get(
      Uri.parse('$url'),
      headers: {
        "Content-Language": "ru",
        "Accept": "application/json",
        "Authorization": "Bearer " + await getToken(),
      },
    );
    if (response.statusCode == 200) {
      print('print from history service ' + response.body);
      return HistoryResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error fetching histories');
    }
  }

  getHistoryProducts(int id) async {
    final response = await http.get(
      Uri.parse('$url/$id/details'),
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