import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seven_food/screens/fridge/fridge-screen.dart';
import 'package:seven_food/screens/fridge/fridge-working-screen.dart';
import 'package:seven_food/widgets/custom-snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth-service.dart';

class FridgeService {
  getToken() async {
    AuthService authService = AuthService();
    dynamic token = await authService.getToken();
    return token;
  }

  getId() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.get('id');
    return id;
  }

  openFridge(String fridgeID, BuildContext context) async {
    final response = await http.post(
      Uri.parse('https://7food.kz/api/users/purchases/clients/open?fridge_id=$fridgeID'),
      headers: {
        "Content-Language": "ru",
        "Accept": "application/json",
        "Authorization": "Bearer " + await getToken(),
      },
    );
    final int userId = await getId();
    print(userId);
    if (response.statusCode == 200) {
      try{
        FocusScope.of(context).unfocus();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FridgeWorkingScreen(id: userId),
          ),
        );
      } catch(e) {
        print('catch from fridge service');
        print(e);
      }
    } else {
      showCustomSnackBar(
        context: context,
        message: '${jsonDecode(response.body)["message"]}',
      );
    }
  }
}