import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/provider/fridge-provider.dart';
import 'package:seven_food/screens/main/index.dart';

class FridgeWorkingScreen extends StatelessWidget {
  final id;
  const FridgeWorkingScreen({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<FridgeProvider>(
        model: FridgeProvider()..initPusher(id),
        builder: (context, model, child) {
          return WillPopScope(
            onWillPop: () async {
              print('on will pop');
              model.channel.unbind('App\Events\FridgeProductChanged');
              model.channel.unbind('App\Events\FridgeClosed');
              model.pusher.unsubscribe('user.$id');
              //model.pusher.disconnect();
              return true;
            },
            child: ModalProgressHUD(
              inAsyncCall: model.isLoading,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Scaffold(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  appBar: AppBar(
                    centerTitle: true,
                    elevation: 0,
                    backgroundColor: Color.fromRGBO(71, 83, 109, 1),
                    title: Text(
                      model.isFridgeClosed && model.products.isNotEmpty
                          ? 'Детали покупки'
                          : model.products.isNotEmpty
                              ? 'Ваш выбор'
                              : 'Ваше действие',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    leading: model.products.isNotEmpty
                        ? Visibility(
                            visible: true,
                            child: _buildLeadingButton(context, model),
                          )
                        : Visibility(
                            visible: false,
                            child: _buildLeadingButton(context, model),
                          ),
                  ),
                  body: SafeArea(
                    child: model.isFridgeClosed
                        ? _buildPaymentContainer(context, model)
                        : Column(
                            children: [
                              Stack(children: [
                                Container(
                                  height: 125,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(71, 83, 109, 1),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(0, 0),
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.25),
                                            blurRadius: 4,
                                            spreadRadius: 0)
                                      ]),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 125 / 2),
                                    child: Container(
                                      height: 131,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 0),
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.35),
                                                blurRadius: 4,
                                                spreadRadius: 0.5)
                                          ]),
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text('Дверь открыта'),
                                          Image.asset(
                                              'assets/images/opendoor.png'),
                                          Text(
                                            'Пожалуйста, не забудьте закрыть дверь',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    149, 35, 35, 1),
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

                              //body when fridge open
                              model.products.isNotEmpty
                                  ? Flexible(
                                      child: Container(
                                        width: double.infinity,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: model.products.length,
                                          itemBuilder: (context, index) {
                                            return _buildFridgeCase(
                                                model.products[index].image,
                                                model.products[index].name,
                                                model.products[index].quantity
                                                    .toString(),
                                                model.products[index].price
                                                    .toString(),
                                                context);
                                          },
                                        ),
                                        // child: SingleChildScrollView(
                                        //   child: Column(
                                        //     children: [
                                        //       _buildFridgeCase('ASU 0.5L  ', 1, 150,
                                        //           'assets/images/asu.png', context),
                                        //       _buildFridgeCase('ASU 0.5L  ', 2, 300,
                                        //           'assets/images/asu.png', context),
                                        //       _buildFridgeCase('ASU 0.5L  ', 3, 450,
                                        //           'assets/images/asu.png', context),
                                        //       _buildFridgeCase('ASU 0.5L  ', 4, 600,
                                        //           'assets/images/asu.png', context),
                                        //     ],
                                        //   ),
                                        // ),
                                      ),
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      height: 64,
                                      margin:
                                          EdgeInsets.only(left: 20, right: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(0, 0),
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.35),
                                                blurRadius: 4,
                                                spreadRadius: 0.5)
                                          ]),
                                      child: Text(
                                        ' Возьмите то что хотите взять',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                166, 170, 180, 1),
                                            fontSize: 14),
                                      ),
                                    ),
                            ],
                          ),
                  ),
                  floatingActionButton: model.products.isNotEmpty
                      ? Visibility(
                          visible: model.isFridgeClosed ? false : true,
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 48, right: 47, bottom: 34),
                            decoration: BoxDecoration(
                              color: Color(0xFF47536D),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: double.infinity,
                            height: 63,
                            alignment: Alignment.center,
                            child: Text(
                              model.response.sum,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerDocked,
                ),
              ),
            ),
          );
        });
  }

  _buildFridgeCase(
      String imageName, String name, String count, String price, context) {
    return Container(
      margin: EdgeInsets.only(top: 21, right: 17, left: 17),
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
          Image.network(
            imageName,
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
                      Text(name),
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
                      Text(count),
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

  _buildPaymentContainer(context, model) {
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
                model.fridgeClosedResponse.status == 'ok'
                    ? Text(
                        model.fridgeClosedResponse.title,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 128, 0, 1),
                          fontSize: 20,
                        ),
                      )
                    : Text(
                        model.fridgeClosedResponse.title,
                        style: TextStyle(
                          color: Color.fromRGBO(149, 35, 35, 1),
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
                          color: model.fridgeClosedResponse.status == 'ok'
                              ? Color.fromRGBO(0, 128, 0, 1)
                              : Color.fromRGBO(149, 35, 35, 1),
                          width: 4),
                      borderRadius: BorderRadius.circular(100)),
                  child: model.fridgeClosedResponse.status == 'ok'
                      ? Icon(
                          Icons.check,
                          color: Color.fromRGBO(0, 128, 0, 1),
                          size: 40,
                        )
                      : Icon(
                          Icons.close,
                          color: Color.fromRGBO(149, 35, 35, 1),
                          size: 40,
                        ),
                ),
                SizedBox(
                  height: 50,
                ),
                model.fridgeClosedResponse.status == 'ok'
                    ? Text(
                        model.fridgeClosedResponse.content,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff495D8F),
                          fontSize: 17,
                        ),
                      )
                    : Text(
                        model.fridgeClosedResponse.content,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(149, 35, 35, 1),
                          fontSize: 17,
                        ),
                      ),
                Visibility(
                  visible:
                      model.fridgeClosedResponse.status == 'ok' ? true : false,
                  child: Container(
                    width: 100,
                    height: 40,
                    margin: EdgeInsets.only(top: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color(0xff596273), width: 0.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      model.fridgeClosedResponse.sum,
                      style: TextStyle(fontSize: 17),
                    ),
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
                    model.channel.unbind('App\Events\FridgeProductChanged');
                    model.channel.unbind('App\Events\FridgeClosed');
                    model.pusher.unsubscribe('user.$id');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => IndexScreen()),
                        (route) => false);
                  },
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
                    model.fridgeClosedResponse.status == 'ok'
                        ? 'Посмотреть историю'
                        : 'На Главную',
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

  _buildLeadingButton(context, model) {
    return IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        model.channel.unbind('App\Events\FridgeProductChanged');
        model.channel.unbind('App\Events\FridgeClosed');
        model.pusher.unsubscribe('user.$id');
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => IndexScreen()),
          (route) => false,
        );
      },
    );
  }
}
