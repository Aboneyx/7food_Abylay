import 'package:flutter/material.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/provider/home_provider.dart';
import 'package:seven_food/screens/main/map-screen.dart';
import 'package:seven_food/screens/main/showcase-screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(251, 251, 251, 1),
        appBar: AppBar(
            toolbarHeight: 0.10 * MediaQuery.of(context).size.height,
            centerTitle: true,
            backgroundColor: Color.fromRGBO(71, 83, 109, 1),
            title: Text(
              '7food на карте',
              textAlign: TextAlign.center,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            )),
        body: BaseProvider<HomeProvider>(
            model: HomeProvider()..initData(),
            builder: (context, model, child) {
              return model.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(71, 83, 109, 1),
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  height:
                                      0.05 * MediaQuery.of(context).size.height,
                                  width:
                                      0.46 * MediaQuery.of(context).size.width,
                                  child: TextButton(
                                    onPressed: () {
                                      model.changeIndex(0);
                                    },
                                    child: Text(
                                      'Список',
                                      style: TextStyle(
                                          color: model.currentIndex == 1
                                              ? Color.fromRGBO(71, 83, 109, 1)
                                              : Colors.white,
                                          fontSize: 18.0),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          model.currentIndex == 0
                                              ? Color.fromRGBO(71, 83, 109, 1)
                                              : Color.fromRGBO(
                                                  255, 255, 255, 1),
                                        ),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius: BorderRadius.horizontal(
                                              right: Radius.zero,
                                              left: Radius.circular(5)),
                                        ))),
                                  )),
                              SizedBox(
                                  height:
                                      0.05 * MediaQuery.of(context).size.height,
                                  width:
                                      0.46 * MediaQuery.of(context).size.width,
                                  child: TextButton(
                                    onPressed: () {
                                      model.changeIndex(1);
                                    },
                                    child: Text(
                                      'На карте',
                                      style: TextStyle(
                                          color: model.currentIndex == 0
                                              ? Color.fromRGBO(71, 83, 109, 1)
                                              : Colors.white,
                                          fontSize: 18.0),
                                    ),
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                model.currentIndex == 0
                                                    ? Color.fromRGBO(255, 255,
                                                        255, 1)
                                                    : Color.fromRGBO(
                                                        71, 83, 109, 1)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius: BorderRadius.horizontal(
                                              left: Radius.zero,
                                              right: Radius.circular(5)),
                                        ))),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 17,
                            width: MediaQuery.of(context).size.width),
                        Flexible(
                          fit: FlexFit.loose,
                          child: IndexedStack(
                            index: model.currentIndex,
                            children: [
                              Visibility(
                                visible: model.currentIndex == 0,
                                child: buildList(context, model),
                              ),
                              Visibility(
                                visible: model.currentIndex == 1,
                                child: MapScreen(), //MapScreen(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            }));
  }

  buildList(context, model) {
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: model.locationsList.length,
        itemBuilder: (context, index) {
          return buildCases(model.locationsList[index].name,
              model.locationsList[index].address, context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowcaseScreen(
                        showCaseID: model.locationsList[index].id,
                      )),
            );
          });
        });
  }

  buildCases(String title, String text, context, Function function) {
    double margin = 0.04 * MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 14, left: margin, right: margin),
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
      // height: 70,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          // onTap: function(),
          onTap: () {
            function();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset(
                    "assets/images/first_sc_pic.png",
                    width: 65,
                    height: 65,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        text.split(',')[2],
                        // text,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,
                        // maxLines: 2,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                  // SizedBox( width: 80,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 17.0),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
