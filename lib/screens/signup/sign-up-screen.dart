import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/data/services/auth-service.dart';
import 'package:seven_food/provider/reg-data.dart';
import 'package:seven_food/screens/signup/confirm.dart';
import 'package:seven_food/widgets/custom-button.dart';

class SignUp extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BaseProvider<RegDataProvider>(
        model: RegDataProvider(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            body: ModalProgressHUD(
              inAsyncCall: model.isLoading,
              child: Stack(
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
                          height: 0.37 * size.height + 23,
                          width: 0.82 * size.width,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 0.37 * size.height,
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
                                  'Регистрация',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(116, 115, 115, 1)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: TextFormField(
                                  controller: model.enteredStringControllerPhone,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    focusColor: Colors.grey,
                                    labelText: 'Номер',
                                    prefix: Text('+7 '),
                                    labelStyle: TextStyle(
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(116, 115, 115, 1),
                                    ),
                                  ),
                                  inputFormatters: [
                                    MaskedInputFormatter('(###)-###-####'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                child: TextFormField(
                                  controller: model.enteredStringControllerName,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    focusColor: Colors.grey,
                                    labelText: 'Имя',
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
                                  controller:
                                      model.enteredStringControllerPassword,
                                  obscureText: true,
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
                          child: SizedBox(
                              width: 0.82 * size.width,
                              child: Center(
                                child: SizedBox(
                                  width: 0.52 * size.width,
                                  child: TextButton(
                                    onPressed: () async {
                                      model.setLoading(true);
                                      FocusScope.of(context).unfocus();
                                      if (model.enteredStringControllerPassword
                                              .text.isNotEmpty &&
                                          model.enteredStringControllerPhone.text
                                              .isNotEmpty &&
                                          model.enteredStringControllerName.text
                                              .isNotEmpty) {
                                        var phoneToBack = model
                                            .enteredStringControllerPhone.text
                                            .replaceAll(RegExp(r'[()-]'), "");
                                        phoneToBack = '7' + phoneToBack;
                                        print(
                                            'Phone number from signup screen: ' +
                                                phoneToBack);
                                        print(model.enteredStringControllerName.text + ' ' +
                                            model.enteredStringControllerPhone.text + ' ' + model.enteredStringControllerPassword.text);
                                        try {
                                          final phone = await _auth.signUpUser(
                                              model.enteredStringControllerName
                                                  .text,
                                              phoneToBack,
                                              model
                                                  .enteredStringControllerPassword
                                                  .text,
                                              context);

                                          print(model.enteredStringControllerName.text + ' ' +
                                            model.enteredStringControllerPhone.text + ' ' + model.enteredStringControllerPassword.text);
                                          model.setLoading(false);
                                          if(phone != null) {

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => ConfirmScreen(
                                                      phone: model
                                                          .enteredStringControllerPhone
                                                          .text,
                                                      page: 'register')),
                                            );
                                          }
                                        } catch (e) {
                                          print('Exception from catch: ');
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
                                    style: buttonStyle,
                                    //minimumSize: MaterialStateProperty<Size>(size.width-60),
                                  ),
                                ),
                              )
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
