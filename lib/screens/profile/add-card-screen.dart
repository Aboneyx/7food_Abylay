import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/provider/mycard-provider.dart';

class MyCardScreen extends StatelessWidget {
  const MyCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<MyCardProvider>(
        model: MyCardProvider(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(251, 251, 251, 1),
            appBar: AppBar(
                //toolbarHeight: 0.10 * MediaQuery.of(context).size.height,
                centerTitle: true,
                backgroundColor: Color.fromRGBO(71, 83, 109, 1),
                title: Text(
                  'Мои карты',
                  textAlign: TextAlign.center,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                )
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 26,
                    ),
                    Container(
                      height: 50,
                      width: 0.89*MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 21, right: 19),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset.zero,
                            blurRadius: 8,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.25),
                          )
                        ],
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Color(0xFF008000),
                                    groupValue: model.isEnabled,
                                    value: Cards.FixedCard,
                                    // ignore: unnecessary_question_mark
                                    onChanged: (value) {
                                      model.changeRadio(Cards.FixedCard);
                                    },
                                    splashRadius: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Название карты',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromRGBO(97, 62, 234, 0.5),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/mc45.png",
                                            height: 24,
                                            width: 24,
                                          ),
                                          Text(
                                            ' •••• 8745',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 19),
                                child: Icon(Icons.arrow_forward_ios,
                                  color: Color.fromRGBO(97, 62, 234, 1),
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),




                    Container(
                      height: 50,
                      width: 0.89*MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 21, right: 19, top: 11),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset.zero,
                            blurRadius: 8,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.25),
                          )
                        ],
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Color(0xFF008000),
                                    groupValue: model.isEnabled,
                                    value: Cards.Card1,
                                    onChanged: (value) {
                                      model.changeRadio(Cards.Card1);
                                    },
                                    splashRadius: 5,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Название карты',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromRGBO(97, 62, 234, 0.5),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/mc45.png",
                                            height: 24,
                                            width: 24,
                                          ),
                                          Text(
                                            ' •••• 8745',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 19),
                                child: Icon(Icons.arrow_forward_ios,
                                  color: Color.fromRGBO(97, 62, 234, 1),
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),



                    Container(
                      height: 50,
                      width: 0.89*MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 21, right: 19, top: 11),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset.zero,
                            blurRadius: 8,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.25),
                          )
                        ],
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 19),
                                child: Row(
                                  children: [
                                    Text(
                                      'Добавить карту',
                                      style: TextStyle(
                                        fontSize: 16
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 19),
                                child: Icon(Icons.arrow_forward_ios,
                                  color: Color.fromRGBO(97, 62, 234, 1),
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        });
  }
}
