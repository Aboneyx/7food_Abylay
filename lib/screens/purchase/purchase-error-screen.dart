import 'package:flutter/material.dart';
import 'package:seven_food/screens/main/HomeScreen.dart';

class PurchaseError extends StatelessWidget {
  const PurchaseError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 251, 251, 1),
      appBar: AppBar(
        //toolbarHeight: 0.10 * MediaQuery.of(context).size.height,
          centerTitle: true,
          backgroundColor: Color.fromRGBO(71, 83, 109, 1),
          title: Text(
            'Детали покупки',
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox( height: 0.13*MediaQuery.of(context).size.height,),
                Text(
                  'Не достаточно средств',
                  style: TextStyle(
                    color: Color.fromRGBO(149, 35, 35, 1),
                    fontSize: 20,
                  ),
                ),
                SizedBox( height: 40,),
                Container(
                  height: 149,
                  width: 149,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(149, 35, 35, 1),
                          width: 4
                      ),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Icon(
                    Icons.close,
                    color: Color.fromRGBO(149, 35, 35, 1),
                    size: 40,
                  ),
                ),
                SizedBox( height: 50,),
                Text(
                    'Пополните карту для новой \nпокупки',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(149, 35, 35, 1),
                    fontSize: 17,
                  ),
                ),

              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 48, right: 47, bottom: 34),
              child: SizedBox(
                height: 63,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()), (route) => false
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF47536D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    'На Главную',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
