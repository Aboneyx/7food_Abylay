import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seven_food/data/model/add-card-model.dart';
import 'package:seven_food/data/model/user-card-model.dart';
import 'package:seven_food/widgets/custom-snackbar.dart';

import 'auth-service.dart';

const url = "https://7food.kz/api/users/cards";

class CardService {
  getToken() async {
    AuthService authService = AuthService();
    dynamic token = await authService.getToken();
    return token;
  }

  getCardId() async {
    List<UserCardModel> cards = await getUserCard();
    int cardID = cards[0].id;
    return cardID.toString();
  }

  Future<List<UserCardModel>> getUserCard() async {
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
      return CardResponse.fromJson(jsonDecode(response.body)).data;
    } else {
      throw Exception('Error fetching cards');
    }
  }

  Future<AddCardResponse> addCard() async {
    final response = await http.post(
      Uri.parse('$url/add'),
      headers: {
        "Content-Language": "ru",
        "Accept": "application/json",
        "Authorization": "Bearer " + await getToken(),
      },
    );
    if (response.statusCode == 200) {
      return AddCardResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error adding card');
    }
  }

  Future<void> deleteCard(BuildContext context) async {
    final response = await http.delete(
      Uri.parse('$url/' + await getCardId() + '/delete'),
      headers: {
        "Content-Language": "ru",
        "Accept": "application/json",
        "Authorization": "Bearer " + await getToken(),
      },
    );
    if (response.statusCode == 200) {
      Future.delayed(Duration(microseconds: 200)).whenComplete(
            () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 6.0,
            behavior: SnackBarBehavior.floating,
            content: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Карта удалена',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            backgroundColor: Colors.green,
          ),
        ),
      );
    } else {
      showCustomSnackBar(
        context: context,
        message: '${jsonDecode(response.body)["message"]}',
      );
    }
  }
}
