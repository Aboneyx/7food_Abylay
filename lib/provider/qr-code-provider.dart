import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_food/base/bloc.dart';
import 'package:seven_food/data/services/fridge-service.dart';

class QRCodeProvider extends BaseBloc {
  FridgeService fridgeService = FridgeService();
  bool checker = false;
  void onCompleted(String val){
    if(val == '55555'){
      checker = true;

      print('From qr code alert dialog!');
    }
    else {
      print("done $val");
    }
    notifyListeners();
  }

  pullAfterCode(String fridgeCode, context) async {
    setLoading(true);
    try{
      await fridgeService.openFridge(fridgeCode, context);
      print(fridgeCode);
      checker = false;
    } catch (e) {
      checker = true;
      print(fridgeCode);
      print('catch in pull After Code ' + fridgeCode);
      print(e);
    }
    setLoading(false);
    notifyListeners();
  }

  drawAlertDialog(context) {
    return showDialog(context: context, builder: (context) =>
        CupertinoAlertDialog(
          title: const Text('Ошибка при сканировании',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Просканируйте другой QR код,\nили просканируйте этот QR код еще раз',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),

          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: const Text(
                  'Понятно',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff613EEA)
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ));
  }

}