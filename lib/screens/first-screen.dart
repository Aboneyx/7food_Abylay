import 'package:flutter/material.dart';
import 'package:seven_food/screens/login/login-screen.dart';
import 'package:seven_food/screens/signup/sign-up-screen.dart';
import 'package:url_launcher/url_launcher.dart';

class FirstScreen extends StatelessWidget {
  static const _url = 'https://flutter.dev';
  void _launchURL() async =>
      await canLaunch('https://flutter.dev') ? await launch('https://flutter.dev') : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 160,
                ),
                Text(
                  '7food',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 15.0, 0, 0),
                  child: Text(
                    'Привет!',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Добро пожаловать в 7food!',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Image.asset("assets/images/first_sc_pic.png", width: size.width-120,),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 5.0, 0, 15.0),
                  child: Text(
                    'Скоро вы сможете купить все что захотите,\nсначала нужно зарегистрироывться',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Text(
                  'Нажмите на кнопку “Начать регистрацию”,\n я принимаю условия',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
                InkWell(
                  onTap: ()=> _launchURL(),
                  child: Text(
                    'пользовательского соглашения',
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 13.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    width: size.width-60,
                    height: 50,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(71, 83, 109, 1)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),

                        //minimumSize: MaterialStateProperty<Size>(size.width-60),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text(
                        'Начать регистрацию',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    width: size.width-60,
                    height: 50,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(71, 83, 109, 1)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                        //minimumSize: MaterialStateProperty<Size>(size.width-60),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Войти',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),

                    ),
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}