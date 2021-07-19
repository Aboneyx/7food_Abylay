import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const url = 'https://7food.kz/api/auth';

class AuthService {
  loginWithNumAndPassword(
      String phone, String password, BuildContext context) async {
    final response = await http.post(
      Uri.parse('$url/login?phone=$phone&password=$password'),
      headers: {"Content-Language": "ru", "Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse != null) {
        print('loginWithNumAndPassword');
        saveTokenAndID(jsonResponse["token"], jsonResponse["id"]);
      }
      return jsonResponse;
    } else {
      print('${jsonDecode(response.body)["message"]}');
    }
  }

  postPhoneNum(String phone, context) async {
    final response = await http.post(
      Uri.parse('$url/login/phone?phone=$phone'),
      headers: {"Content-Language": "ru", "Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      print('${jsonDecode(response.body)["message"]}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 6.0,
          behavior: SnackBarBehavior.floating,
          content: Container(
            child: Text(
              '${jsonDecode(response.body)["message"]}',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  loginWithVerificationCode(
      String phone, String verificationCode, context) async {
    final response = await http.post(
      Uri.parse(
          '$url/login/confirm?phone=$phone&verification_code=$verificationCode'),
      headers: {"Content-Language": "ru", "Accept": "application/json"},
    );
    print('$url/login/confirm?phone=$phone&verification_code=$verificationCode');
    print(response.body);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      saveTokenAndID(jsonResponse["token"], jsonResponse["id"]);
      return jsonResponse;
    } else {
      print('${jsonDecode(response.body)["message"]}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 6.0,
          behavior: SnackBarBehavior.floating,
          content: Container(
            child: Text(
              '${jsonDecode(response.body)["message"]}',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  confirmPhoneNumWhenRegistering(
      String phone,
      String verificationCode,
      context
      ) async {
    final response = await http.post(Uri.parse('$url/register/confirm?phone=$phone&verification_code=$verificationCode'),
      headers: {
        "Content-Language": "ru",
        "Accept": "application/json",
      },
    );
    print("from service:" + verificationCode);
    print('$url/register/confirm?phone=$phone&verification_code=$verificationCode');
    print('status code:' + response.statusCode.toString());
    print(response.body);
    if(response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse != null) {
        saveTokenAndID(jsonResponse["token"], jsonResponse["id"]);
      }
      return jsonResponse;
    }
    else{
      print('${jsonDecode(response.body)["message"]}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 6.0,
          behavior: SnackBarBehavior.floating,
          content: Container(
            child: Text(
              '${jsonDecode(response.body)["message"]}',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  signUpUser(
      String name,
      String phone,
      String password,
      context
      ) async {
    final response = await http.post(
      Uri.parse('$url/register?name=$name&phone=$phone&password=$password&password_confirmation=$password'),
      headers: {
        "Content-Language": "ru",
        "Accept": "application/json",
      },
    );
    //print(response.statusCode);
    if(response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } else {
      print('${jsonDecode(response.body)["message"]}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 6.0,
          behavior: SnackBarBehavior.floating,
          content: Container(
            child: Text(
              '${jsonDecode(response.body)["message"]}',
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  logOutUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  saveTokenAndID(String token, int id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    prefs.setInt('id', id);
  }

  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get('token');
    if(value != null) {
      print(value);
      return value;
    }
    else {
      return "TokenIsNUll";
    }
  }

  Future getId() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.get('userID');
    return id;
  }

}
