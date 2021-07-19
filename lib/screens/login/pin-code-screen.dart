import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/data/services/auth-service.dart';
import 'package:seven_food/provider/pin-code-provider.dart';
import 'package:seven_food/screens/first-screen.dart';
import 'package:seven_food/screens/login/login-screen.dart';
import 'package:seven_food/screens/main/index.dart';

class PinCodeScreen extends StatelessWidget {
  final String id;
  const PinCodeScreen({Key? key, required this.id}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BaseProvider<PinCodeProvider>(
      model: PinCodeProvider(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(255, 255, 255, 1), //Colors.deepOrange,
            elevation: 0,
            leadingWidth: 90,
            leading: InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: 90,
                child: TextButton(
                  onPressed: () { SystemNavigator.pop(); },
                  child: Text(
                    'Закрыть',
                    style: TextStyle(
                      color: Color.fromRGBO(88, 88, 88, 1),
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    //SystemNavigator.pop();
                    alertDialog(context);
                  },
                  icon: Icon(
                    Icons.login,
                    color: Color.fromRGBO(97, 62, 234, 1),
                  )
              )
            ],
          ),
          body: Column(
            children: [

              SizedBox(
                height: 0.18 * size.height,
              ),
              Center(
                child: Text(
                  'Быстрый вход',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color.fromRGBO(71, 83, 109, 1),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    id == 'initial' ? 'Введите код доступа к приложению' : 'Установите код доступа к приложению',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromRGBO(71, 83, 109, 1),
                    ),
                  ),
                ),
              ),
              PINNumber(model: model),
              SizedBox(height: 80,),
              buildNumberPad(model, context),
            ],
          ),
        );
      }
    );
  }

  buildNumberPad(PinCodeProvider model, context) {
    return Expanded(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    KeyboardNumber(
                      n:1,
                      onPressed: () {
                        model.onEntered('1', id, context);
                      },
                    ),
                    KeyboardNumber(
                      n:2,
                      onPressed: () {
                        model.onEntered('2', id, context);
                      },
                    ),
                    KeyboardNumber(
                      n:3,
                      onPressed: () {
                        model.onEntered('3', id, context);
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    KeyboardNumber(
                      n:4,
                      onPressed: () {
                        model.onEntered('4', id, context);
                      },
                    ),
                    KeyboardNumber(
                      n:5,
                      onPressed: () {
                        model.onEntered('5', id, context);
                      },
                    ),
                    KeyboardNumber(
                      n:6,
                      onPressed: () {
                        model.onEntered('6', id, context);
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    KeyboardNumber(
                      n:7,
                      onPressed: () {
                        model.onEntered('7', id, context);
                      },
                    ),
                    KeyboardNumber(
                      n:8,
                      onPressed: () {
                        model.onEntered('8', id, context);
                      },
                    ),
                    KeyboardNumber(
                      n:9,
                      onPressed: () {
                        model.onEntered('9', id, context);
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () async {
                          if(id == 'initial') {
                            final isAuthenticated = await model.authenticate();
                            if(isAuthenticated) {
                              print('Initial and authenticated!');
                              //IndexScreen();
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => IndexScreen()), (route) => false
                              );
                            }
                          }
                        },
                        child: Icon(Icons.fingerprint, size: 50,)),
                    KeyboardNumber(
                      n:0,
                      onPressed: () {
                        model.onEntered('0', id, context);
                        // Navigator.pushAndRemoveUntil(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => IndexScreen()), (route) => false
                        // );

                      },
                    ),
                    InkWell(
                      onTap: () {
                        model.delete();
                      },
                      child: Text('Удалить'),
                    )
                  ],
                )
              ],
            ),
          ),
        )
    );
  }



}


class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  KeyboardNumber({required this.n, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      child: MaterialButton(
        padding: EdgeInsets.all(8.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        height: 90,
        child: Text(
          '$n',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24*MediaQuery.of(context).textScaleFactor,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PINNumber extends StatelessWidget{
  final PinCodeProvider model;

  const PINNumber({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 50,
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, i){

          return model.isEntered[i]? Icon(Icons.circle, size: 16,) : Icon(Icons.circle, color: Color(0xffC4C4C4), size: 16,);
        },
        separatorBuilder: (context, i) => SizedBox(width: 20,),
      ),
    );
  }
}


Future alertDialog(BuildContext context) async {
  AuthService _authService = AuthService();
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text('Важно!'),
      content: Text('Вы уверены что хотите выйти?'),
      actions: [
        CupertinoDialogAction(
          child: Text('Отмена'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        CupertinoDialogAction(
          child: Text(
            'Да',
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            _authService.logOutUser();
            Navigator.of(context).pop();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => FirstScreen(),
                ),
                    (route) => false);
          },
        ),
      ],
    ),
  );
}

