import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/provider/detailed-history-provider.dart';

class DetailHistory extends StatelessWidget {
  final int historyID;
  const DetailHistory({Key? key, required this.historyID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<DetailHistoryProvider>(
        model: DetailHistoryProvider()..getHistoryProducts(historyID),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(251, 251, 251, 1),
            appBar: AppBar(
                //toolbarHeight: 0.10 * MediaQuery.of(context).size.height,
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                backgroundColor: Color.fromRGBO(71, 83, 109, 1),
                title: Text(
                  'История',
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
                : Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 23,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              offset: Offset.zero,
                              blurRadius: 1,
                              spreadRadius: 0.8,
                              color: Colors.black.withOpacity(0.25),
                            )
                          ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                model.date.replaceAll('-', '.'),
                              ),
                              Text(
                                model.time,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          height: 44,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              offset: Offset.zero,
                              blurRadius: 1,
                              spreadRadius: 0.8,
                              color: Colors.black.withOpacity(0.25),
                            )
                          ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Номер покупки',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '$historyID',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          height: 44,
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              offset: Offset.zero,
                              blurRadius: 1,
                              spreadRadius: 0.8,
                              color: Colors.black.withOpacity(0.25),
                            )
                          ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Местоположение',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  model.address,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          height: 44,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(71, 83, 109, 1),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset.zero,
                                  blurRadius: 1,
                                  spreadRadius: 0.8,
                                  color: Colors.black.withOpacity(0.25),
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Итоговая сумма',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  model.total,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          child: ListView.builder(
                            itemCount: model.details.length,
                            itemBuilder: (context, index) {
                              return buildHistoryDetail(
                                  context,
                                  model.details[index].image,
                                  model.details[index].name,
                                  model.details[index].quantity,
                                  model.details[index].price,
                                  model.details[index].sum,);
                            }
                          ),
                          // child: ListView(children: [
                          //   buildHistoryDetail(context, 'assets/images/asu.svg',
                          //       'ASU 0.5L  ', '2 шт', '150 тг', '300 тг'),
                          //   buildHistoryDetail(
                          //       context,
                          //       'assets/images/cola.svg',
                          //       'Coca cola',
                          //       '1 шт',
                          //       '420 тг',
                          //       '420 тг'),
                          //   buildHistoryDetail(context, 'assets/images/asu.svg',
                          //       'ASU 0.5L  ', '2 шт', '150 тг', '300 тг'),
                          //   buildHistoryDetail(context, 'assets/images/asu.svg',
                          //       'ASU 0.5L  ', '2 шт', '150 тг', '300 тг'),
                          // ]),
                        )
                      ],
                    ),
                  ),
          );
        });
  }

  buildHistoryDetail(context, String image, String title, String quantity,
      String price, String amount) {
    return Container(
      height: 170,
      margin: EdgeInsets.only(top: 11, left: 18, right: 18),
      padding: EdgeInsets.only(top: 9, right: 12, left: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              blurRadius: 2,
              spreadRadius: 2,
              color: Colors.black.withOpacity(0.25),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(image, width: MediaQuery.of(context).size.width*0.27,),
          Column(
            children: [
              buildRowForHistoryDet(
                  context, 'Название', title, FontWeight.normal),
              SizedBox(
                height: 4,
              ),
              buildRowForHistoryDet(
                  context, 'Количество', quantity, FontWeight.normal),
              SizedBox(
                height: 4,
              ),
              buildRowForHistoryDet(context, 'Цена', price, FontWeight.normal),
              SizedBox(
                height: 4,
              ),
              buildRowForHistoryDet(context, 'Сумма', amount, FontWeight.bold),
            ],
          )
        ],
      ),
    );
  }

  buildRowForHistoryDet(context, String leftWord, String rightWord, option) {
    return Container(
      padding: EdgeInsets.only(left: 11, right: 5),
      height: 35,
      width: 0.6 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(239, 242, 247, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftWord,
            style: TextStyle(fontSize: 14, fontWeight: option),
          ),
          Text(
            rightWord,
            style: TextStyle(fontSize: 14, fontWeight: option),
          ),
        ],
      ),
    );
  }
}

//Navigator.pop(context);
