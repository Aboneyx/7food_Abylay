import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/data/services/auth-service.dart';
import 'package:seven_food/provider/forgot-data.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import 'confirm-login.dart';

class LoginForgotPassScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BaseProvider<ForgoDataProvider>(
        model: ForgoDataProvider(),
        builder: (context, model, child) {
          return Scaffold(
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
                            height: 0.19 * size.height + 23,
                            width: 0.82 * size.width,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 0.19 * size.height,
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
                                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                  child: Text(
                                    'Вход',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(116, 115, 115, 1),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: TextFormField(
                                    autofocus: true,
                                    controller:
                                        model.enteredStringControllerPhone,
                                    keyboardType: TextInputType.phone,
                                    //maxLength: 14,
                                    decoration: InputDecoration(
                                      prefix: Text('+7 '),
                                      focusColor: Colors.grey,
                                      labelText: 'Номер',
                                      labelStyle: TextStyle(
                                        fontSize: 14.0,
                                        color: Color.fromRGBO(116, 115, 115, 1),
                                      ),
                                    ),
                                    inputFormatters: [
                                      MaskedInputFormatter('(###)-###-####'),
                                    ],
                                    // onChanged: (value) {
                                    //     model.enteredStringControllerPhone.text = value.replaceAll(
                                    //         RegExp(r'[()-]'), "");
                                    // },
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
                                    if (model.enteredStringControllerPhone.text
                                        .isNotEmpty) {
                                      var phoneToBack =  model.enteredStringControllerPhone.text.replaceAll(
                                          RegExp(r'[()-]'), "");
                                      print('LoginForgotPasswordScreen: ' + '7'+ phoneToBack);
                                      final response =
                                          await authService.postPhoneNum('7'+ phoneToBack,
                                              context);
                                      model.setLoading(false);
                                      if (response != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ConfirmLoginScreen(
                                                  phone:  model
                                                      .enteredStringControllerPhone
                                                      .text,
                                                  page: 'login')),
                                        );
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
                                  ),
                                ),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
