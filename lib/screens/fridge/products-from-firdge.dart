import 'package:flutter/material.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/provider/fridge-provider.dart';

class ProductsFromFridgeScreen extends StatelessWidget {
  const ProductsFromFridgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<FridgeProvider>(
        model: FridgeProvider(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            appBar: AppBar(
              //toolbarHeight: 0.10 * MediaQuery.of(context).size.height,
                centerTitle: true,
                elevation: 0,
                backgroundColor: Color.fromRGBO(71, 83, 109, 1),
                title: Text(
                  'Детали покупки',
                  textAlign: TextAlign.center,
                ),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.vertical(
                //     bottom: Radius.circular(10),
                //   ),
                // )
            ),
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
                          ]),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: Material(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(71, 83, 109, 1),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          'Ваш выбор',
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

                  //body
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildFridgeCase('ASU 0.5L  ', 1, 150,
                                'assets/images/asu.png', context),
                            _buildFridgeCase('ASU 0.5L  ', 2, 300,
                                'assets/images/asu.png', context),
                            _buildFridgeCase('ASU 0.5L  ', 3, 450,
                                'assets/images/asu.png', context),
                            _buildFridgeCase('ASU 0.5L  ', 4, 600,
                                'assets/images/asu.png', context),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _buildFridgeCase(
      String text, int quantity, double price, String image, context) {
    return Container(
      margin: EdgeInsets.only(top: 21),
      width: 0.90 * MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              blurRadius: 3,
              spreadRadius: 1,
              color: Colors.black.withOpacity(0.35),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            height: 110,
            width: 60,
            //color: Colors.red,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 35,
                width: 0.58 * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(239, 242, 247, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Название'),
                      Text(text),
                    ],
                  ),
                ),
              ),
              Container(
                height: 35,
                width: 0.58 * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(239, 242, 247, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Количество'),
                      Text(quantity.toString()),
                    ],
                  ),
                ),
              ),
              Container(
                height: 35,
                width: 0.58 * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(239, 242, 247, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Цена'),
                      Text(price.toString() + ' тг'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildPaymentContainer(context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 0.13 * MediaQuery.of(context).size.height,
                ),
                Text(
                  'Успешная оплата',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 128, 0, 1),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 149,
                  width: 149,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromRGBO(0, 128, 0, 1), width: 4),
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.check,
                    color: Color.fromRGBO(0, 128, 0, 1),
                    size: 40,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Сумма списанная\nс вашей карты',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff495D8F),
                    fontSize: 17,
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  margin: EdgeInsets.only(top: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff596273), width: 0.5),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    '390 тг',
                    style: TextStyle(fontSize: 17),
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
                  onPressed: () {},
                  // _showTopFlash(context, style: FlashBehavior.fixed),
                  // Navigator.push(context,
                  //   MaterialPageRoute(builder: (context) => PurchaseError())
                  // );

                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF47536D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    'Посмотреть историю',
                    style: TextStyle(fontSize: 14, color: Colors.white),
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
