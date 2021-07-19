import 'package:flutter/material.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/provider/history-provider.dart';
import 'package:seven_food/screens/history/detailed-history-screen.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<HistoryProvider>(
        model: HistoryProvider()..initData(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Color.fromRGBO(251, 251, 251, 1),
            appBar: AppBar(
                //toolbarHeight: 0.10 * MediaQuery.of(context).size.height,
                centerTitle: true,
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
                : model.historyList.data.isEmpty
                    ? Center(
                        child: Text(
                          'Вы еще не совершали никаких покупок',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                    : Container(
                        child: buildHistoryList(context, model),
                      ),
          );
        });
  }

  buildHistoryList(context, model) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.historyList.data.length,
      itemBuilder: (context, index) {
        return buildHistoryCase(
            context,
            model,
            model.historyList.data[index].createdAt,
            model.historyList.data[index].address,
            model.historyList.data[index].details[0].name,
            model.historyList.data[index].details[0].quantity,
            model.historyList.data[index].details[0].name,
            model.historyList.data[index].details[0].quantity,
            model.historyList.data[index].price, () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailHistory(historyID: model.historyList.data[index].id,)));
        });
      },
    );
  }

  buildHistoryCase(
      context,
      model,
      String date,
      String address,
      String detailsName1,
      int detailsQuantity1,
      String detailsName2,
      int detailsQuantity2,
      String price,
      Function function) {
    double margin = 0.04 * MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 8, left: margin, right: margin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 8.0),
            child: Text(
              DateFormat('dd.MM.yyyy').format(
                DateTime.parse(date),
              ),
              style: TextStyle(
                color: Color.fromRGBO(97, 62, 234, 1),
                fontSize: 12,
              ),
            ),
          ),
          Container(
            width: 0.9 * MediaQuery.of(context).size.width,
            height: 77,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    offset: Offset.zero,
                    blurRadius: 3,
                    spreadRadius: 1,
                    color: Colors.black.withOpacity(0.35),
                  )
                ]),
            child: Material(
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                onTap: () {
                  function();
                  //model.changeIndex(1);
                },
                borderRadius: BorderRadius.circular(4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/images/first_sc_pic.png',
                      width: 65,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            address,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '$detailsQuantity1 x $detailsName1',
                            style: TextStyle(
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            '$detailsQuantity2 x $detailsName2',
                            style: TextStyle(
                              fontSize: 9,
                            ),
                          ),
                          Text(
                            price,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 0.38 * MediaQuery.of(context).size.width,
                    ),
                    Icon(Icons.arrow_forward_ios),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
