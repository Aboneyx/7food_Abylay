import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seven_food/screens/fridge/products-from-firdge.dart';

class FridgeScreen extends StatelessWidget {
  final id;
  const FridgeScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 177,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(71, 83, 109, 1),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          blurRadius: 4,
                          spreadRadius: 0)
                    ]
                ),
              ),
              // SizedBox(height: 190, width: double.infinity,),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Ваше действие',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 177 / 2),
                  child: Container(
                    height: 131,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(255, 255, 255, 1),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              color: Color.fromRGBO(0, 0, 0, 0.35),
                              blurRadius: 4,
                              spreadRadius: 0.5)
                        ]),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Дверь открыта'),
                        Image.asset('assets/images/opendoor.png'),
                        Text(
                          'Пожалуйста, не забудьте закрыть дверь',
                          style: TextStyle(
                              color: Color.fromRGBO(149, 35, 35, 1),
                              fontSize: 11),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
            SizedBox(
              height: 19,
              width: double.infinity,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 64,
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        color: Color.fromRGBO(0, 0, 0, 0.35),
                        blurRadius: 4,
                        spreadRadius: 0.5)
                  ]),
              child: Text(
                ' Возьмите то что хотите взять',
                style: TextStyle(
                    color: Color.fromRGBO(166, 170, 180, 1), fontSize: 14),
              ),
            ),
            ElevatedButton(onPressed: () {
              Timer(Duration(seconds: 3), (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    ProductsFromFridgeScreen()));});
              },
              child: Text(' NEXT PAGE ')
            ),

          ],
        ),
      ),
    );
  }



}
