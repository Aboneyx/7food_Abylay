import 'package:flutter/material.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/provider/reg-data.dart';
import 'package:seven_food/screens/signup/confirm.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String phone;
  final String page;
  const ResetPasswordScreen({Key? key, required this.phone, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BaseProvider<RegDataProvider>(
        model: RegDataProvider(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            body: Stack(
              children: [
                SizedBox(
                  height: size.height - 0.6 * size.height,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(71, 83, 109, 1),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 0.38 * size.height + 23,
                        width: 0.82 * size.width,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 0.38 * size.height,
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
                                'Вход/Регистрация',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.fromLTRB(40, 15, 0, 0),
                              child: Text(
                                'Номер/email',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: TextFormField(
                                controller: model.enteredStringControllerPhone,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
                              child: Text(
                                'Имя',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: TextFormField(
                                controller: model.enteredStringControllerName,
                                keyboardType: TextInputType.name,
                                decoration: InputDecoration(),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.fromLTRB(40, 10, 0, 0),
                              child: Text(
                                'Пароль',
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: TextFormField(
                                controller: model.enteredStringControllerPassword,
                                obscureText: true,
                                decoration: InputDecoration(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: 0.82 * size.width,
                          child: Center(
                              child: SizedBox(
                                width: 0.52 * size.width,
                                child: TextButton(
                                  onPressed: () {
                                    if (model.enteredStringControllerPassword.text
                                        .isNotEmpty &&
                                        model.enteredStringControllerPhone.text
                                            .isNotEmpty &&
                                        model.enteredStringControllerName.text
                                            .isNotEmpty) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ConfirmScreen(
                                                phone: model
                                                    .enteredStringControllerPhone
                                                    .text,
                                                page: 'login')),
                                      );
                                    } else {
                                      final snackBar = SnackBar(
                                        content: Text('Вы оставили некоторые поля пустыми'),
                                        action: SnackBarAction(
                                          label: 'Отменить',
                                          onPressed: () {},
                                        ),
                                      );

                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                )
              ],
            ),
          );
        });
  }
}
