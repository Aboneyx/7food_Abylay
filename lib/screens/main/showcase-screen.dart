import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/provider/showcase-provider.dart';

class ShowcaseScreen extends StatelessWidget {
  final int showCaseID;
  const ShowcaseScreen({Key? key, required this.showCaseID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ShowcaseProvider>(
      model: ShowcaseProvider()..getShowCaseProducts(showCaseID),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color.fromRGBO(71, 83, 109, 1),
              title: Text(
                'Витрина',
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              )
          ),
          backgroundColor: Color.fromRGBO(251, 251, 251, 1),
          body: model.isLoading ? Center(
            child: CircularProgressIndicator(),
          ) : Center(
            child: Container(
              child: buildListCases(context, model, ),
            ),
          ),
        );
      }
    );
  }

  buildListCases(context, model,) {
    return ListView.builder(
      itemCount: model.products.length,
      itemBuilder: (context, index) {
        return _buildShowCase(
            model.products[index].name,
            model.products[index].quantity,
            model.products[index].price,
            model.products[index].image,
            context);
      }
    );
  }

  _buildShowCase(String text, String count, String price, String image, context) {
    return Container(
      margin: EdgeInsets.only(top: 21, right: 18, left: 17),
      width: 0.90*MediaQuery.of(context).size.width,
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
          ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(image,
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
                width:  0.58*MediaQuery.of(context).size.width,
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
                width:  0.58*MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(239, 242, 247, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Количество'),
                      Text(count + ' шт'),
                    ],
                  ),
                ),
              ),
              Container(
                height: 35,
                width:  0.58*MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(239, 242, 247, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Цена'),
                      Text(price + ' тг'),
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
}
