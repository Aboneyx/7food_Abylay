import 'package:flutter/material.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/provider/payment-method-provider.dart';
import 'package:seven_food/screens/main/index.dart';
import 'package:seven_food/screens/profile/webview-screen.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<PaymentMethodProvider>(
        model: PaymentMethodProvider(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(251, 251, 251, 1),
            appBar: AppBar(
                //toolbarHeight: 0.10 * MediaQuery.of(context).size.height,
                centerTitle: true,
                // leading: IconButton(
                //   onPressed: () {},
                //   icon: Icon(Icons.close),
                // ),
                backgroundColor: Color.fromRGBO(71, 83, 109, 1),
                title: Text(
                  'Способ оплаты',
                  textAlign: TextAlign.center,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(8),
                  ),
                )),
            body: model.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 39,
                              width: double.infinity,
                            ),
                            Text(
                              'Выберите, пожалуйста, способ оплаты,\n либо добавьте новую карту',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 31,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 27,
                                ),
                                SizedBox(
                                  width: 55,
                                  height: 29,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        model.setLoading(true);
                                        try {
                                          await model.cardService
                                              .addCard()
                                              .then((response) => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    WebViewContainer(
                                                      response.redirectUrl,
                                                      response.requestUrl,
                                                    ),
                                              ),
                                            ).whenComplete(() {
                                                model.setLoading(false);
                                            }),
                                          });
                                        } catch (e) {
                                          print('payment method screen catch: ');
                                          print(e);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF47536D),
                                      ),
                                      child: Icon(Icons.add)),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'Добавить карту',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, bottom: 32),
                          child: SizedBox(
                            height: 63,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => IndexScreen()),
                                    (route) => false);
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
                                'Пропустить',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                        // InkWell(
                        //   onTap: () {},
                        //   child: Container(
                        //     height: 63,
                        //     decoration: BoxDecoration(
                        //       color: Color(0xFF47536D),
                        //       borderRadius: BorderRadius.all(Radius.circular(10)),
                        //     ),
                        //     margin: EdgeInsets.only(left: 30, right: 30, bottom: 32),
                        //     alignment: Alignment.center,
                        //     child: Text(
                        //       'Пропустить',
                        //         style: TextStyle(
                        //         fontSize: 20,
                        //         color: Colors.white
                        //     ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
          );
        });
  }
}
