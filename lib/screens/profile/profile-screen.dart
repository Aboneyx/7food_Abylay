import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/data/services/auth-service.dart';
import 'package:seven_food/data/services/card-service.dart';
import 'package:seven_food/provider/profile-provider.dart';
import 'package:seven_food/screens/first-screen.dart';
import 'package:seven_food/screens/profile/webview-screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add-card-screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ProfileProvider>(
        model: ProfileProvider()..getProfileInfo(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(251, 251, 251, 1),
            appBar: AppBar(
              //toolbarHeight: 0.10 * MediaQuery.of(context).size.height,
              centerTitle: true,
              backgroundColor: Color.fromRGBO(71, 83, 109, 1),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    'Профиль',
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                      onPressed: () async {
                        AuthService _authService = AuthService();

                        showCupertinoDialog(
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
                                onPressed: () async {
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

                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => FirstScreen()),
                        //     (route) => false);
                      },
                      icon: Icon(Icons.logout))
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
            ),
            body: model.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 28,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 23, top: 23, right: 22),
                          height: 348,
                          width: 0.89 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.0, 5),
                                  blurRadius: 3,
                                  spreadRadius: 0.5,
                                  color: Colors.black.withOpacity(0.25),
                                )
                              ]),
                          child: Column(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Бонусы',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          model.profileInfo.bonus,
                                          style: TextStyle(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(top: 9),
                                      child: Text(
                                        'Имя',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // Жанель Изменить
                                      height: 46,
                                      padding:
                                          EdgeInsets.only(left: 12, right: 18),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(239, 242, 247, 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            model.profileInfo.name,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Text(
                                              'Изменить',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.only(top: 9, bottom: 9),
                                      child: Text(
                                        'Телефон',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // Жанель Изменить
                                      height: 46,
                                      padding:
                                          EdgeInsets.only(left: 12, right: 18),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(239, 242, 247, 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            model.profileInfo.phone,
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Text(
                                              'Изменить',
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin:
                                          EdgeInsets.only(top: 9, bottom: 9),
                                      child: Text(
                                        'Способ оплаты',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 46,
                                      padding:
                                          EdgeInsets.only(left: 12, right: 18),
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(239, 242, 247, 1),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          model.cards.isEmpty
                                              ? Text(
                                                  'У вас нет карт',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                  ),
                                                )
                                              : Row(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/mc45.png",
                                                      height: 24,
                                                      width: 24,
                                                    ),
                                                    Text(
                                                      model.cards[0].maskedPan,
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          model.cards.isEmpty
                                              ? Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      model.setLoading(true);
                                                      try {
                                                        await CardService()
                                                            .addCard()
                                                            .then(
                                                              (response) => {
                                                                Navigator
                                                                    .pushAndRemoveUntil(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            WebViewContainer(
                                                                      response
                                                                          .redirectUrl,
                                                                      response
                                                                          .requestUrl,
                                                                    ),
                                                                  ),
                                                                  (route) =>
                                                                      false,
                                                                ).whenComplete(
                                                                    () {
                                                                  model.setLoading(
                                                                      false);
                                                                }),
                                                              },
                                                            );
                                                      } catch (e) {
                                                        print(e);
                                                      }
                                                    },
                                                    child: Text(
                                                      'Добавить',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Material(
                                                  color: Colors.transparent,
                                                  child: InkWell(
                                                    onTap: () {
                                                      alertDialogForDeleting(
                                                              context)
                                                          .whenComplete(() => model
                                                              .getProfileInfo());
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) =>
                                                      //             MyCardScreen()));
                                                    },
                                                    child: Text(
                                                      'Удалить',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        });
  }

  Future alertDialogForDeleting(BuildContext context) async {
    CardService cardService = CardService();
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Важно!'),
        content: Text(
            'Это действие нельзя отменить!\nВы точно хотите удалить карту?'),
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
            onPressed: () async {
              await cardService.deleteCard(context);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
