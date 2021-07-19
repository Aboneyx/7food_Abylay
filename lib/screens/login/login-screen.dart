import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/data/services/auth-service.dart';
import 'package:seven_food/provider/login-data.dart';
import 'package:seven_food/screens/login/login-forgot-password-screen.dart';
import 'package:seven_food/screens/login/pin-code-screen.dart';

class LoginScreen extends StatelessWidget {
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BaseProvider<LoginDataProvider>(
        model: LoginDataProvider(),
        builder: (context, model, child) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              body: ModalProgressHUD(
                inAsyncCall: model.isLoading,
                color: Color.fromRGBO(71, 83, 109, 1),
                child: Stack(
                  children: [
                    Container(
                      height: size.height - 0.6 * size.height,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(71, 83, 109, 1),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 0.3 * size.height,
                        ),
                        Stack(
                          children: [
                            SizedBox(
                              height: 0.28 * size.height + 23,
                              width: 0.82 * size.width,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 0.28 * size.height,
                              width: 0.82 * size.width,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(0, 0),
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                        blurRadius: 5,
                                        spreadRadius: 3)
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      'Вход',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color.fromRGBO(116, 115, 115, 1),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 40),
                                    child: TextFormField(
                                      inputFormatters: [
                                        MaskedInputFormatter('(###)-###-####'),
                                      ],
                                      keyboardType: TextInputType.phone,
                                      controller:
                                          model.enteredStringControllerPhone,
                                      decoration: InputDecoration(
                                        prefix: Text('+7 '),
                                        focusColor: Colors.grey,
                                        labelText: 'Номер',
                                        labelStyle: TextStyle(
                                          fontSize: 14.0,
                                          color: Color.fromRGBO(116, 115, 115, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 40),
                                    child: TextFormField(
                                      obscureText: true,
                                      controller:
                                          model.enteredStringControllerPassword,
                                      decoration: InputDecoration(
                                        focusColor: Colors.grey,
                                        labelText: 'Пароль',
                                        labelStyle: TextStyle(
                                          fontSize: 14.0,
                                          color: Color.fromRGBO(116, 115, 115, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              //margin: EdgeInsets.fromLTRB(0, (0.2*size.height), 0, 0),
                              child: SizedBox(
                                width: 0.82 * size.width,
                                child: Center(
                                    child: SizedBox(
                                  width: 0.52 * size.width,
                                  child: TextButton(
                                    onPressed: () async {
                                      FocusScope.of(context).unfocus();
                                      model.setLoading(true);
                                      FocusScope.of(context).unfocus();
                                      if (model.enteredStringControllerPhone.text
                                              .isNotEmpty &&
                                          model.enteredStringControllerPassword
                                              .text.isNotEmpty) {
                                        var phoneToBack =  model.enteredStringControllerPhone.text.replaceAll(
                                            RegExp(r'[()-]'), "");
                                        print('7'+ phoneToBack);
                                        try {
                                          final user =
                                              await auth.loginWithNumAndPassword(
                                                  '7'+ phoneToBack,
                                                  model
                                                      .enteredStringControllerPassword
                                                      .text,
                                                  context);
                                          model.setLoading(false);
                                          if (user != null) {
                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PinCodeScreen(id: 'login',)),
                                                (route) => false);
                                          }
                                        } catch (e) {
                                          print(e);
                                        }
                                      } else {
                                        final snackBar = SnackBar(
                                          content: Text(
                                              'Вы оставили некоторые поля пустыми'),
                                          action: SnackBarAction(
                                            label: 'Отменить',
                                            onPressed: () {},
                                          ),
                                        );

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    },
                                    child: Text(
                                      'Отправить',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromRGBO(71, 83, 109, 1)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0))),
                                      //minimumSize: MaterialStateProperty<Size>(size.width-60),
                                    ),
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          // margin: EdgeInsets.fromLTRB(0, (0.65*size.height), 0, 0),
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginForgotPassScreen()),
                              );
                            },
                            child: Text(
                              'Забыли пароль?',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
