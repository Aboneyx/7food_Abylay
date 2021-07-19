import 'package:flutter/material.dart';
import 'package:seven_food/provider/pin-code-provider.dart';
import 'package:seven_food/screens/first-screen.dart';
import 'package:seven_food/screens/fridge/fridge-screen.dart';
import 'package:seven_food/screens/fridge/fridge-working-screen.dart';
import 'package:seven_food/screens/login/pin-code-screen.dart';

import 'data/services/auth-service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthService authService = AuthService();
  dynamic token = await authService.getToken();
  //if(token != null) token = "null";
  runApp(MyApp(token: token));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  late final String token;
  final bool qwer = true;
  MyApp({required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '7food App',

      theme: ThemeData(
        primaryColor: Color.fromRGBO(71, 83, 109, 1),
      ),
      // ignore: unnecessary_null_comparison
      home: (token !=
              "TokenIsNUll" /*&& PinCodeProvider.getPinAfterLogin() != ''*/)
          ? !qwer
              ? FridgeWorkingScreen()
              : PinCodeScreen(id: 'initial')
          : FirstScreen(),
    );
  }
}
