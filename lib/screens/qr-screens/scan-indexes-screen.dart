import 'package:flutter/material.dart';
import 'package:seven_food/screens/qr-screens/qr-screen.dart';

import 'code-screen.dart';

class QRIndex extends StatefulWidget {
  const QRIndex({Key? key}) : super(key: key);

  @override
  _QRIndexState createState() => _QRIndexState();
}

class _QRIndexState extends State<QRIndex> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: _currentIndex,
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 40),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey)
                )
              ),
              padding: EdgeInsets.only(left: 21, right: 21),
              child: TabBar(
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 17
                ),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 17
                ),
                indicatorColor: Colors.deepPurple,
                //indicatorPadding: EdgeInsets.only(left: 10),
                tabs: [
                  Tab(
                  text: 'QR scanner',
                    // child: Text(
                    //   'QR scanner',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 17
                    //   ),
                    // ),
                  ),
                  Tab(
                    text: 'Code from Screen',
                    // child: Text(
                    //   'Code from Screen',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 17
                    //   ),
                    // ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [QRViewExample(), QRCodeScreen()],
        ),
      ),
    );
  }
}
