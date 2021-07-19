import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seven_food/screens/history/history-screen.dart';
import 'package:seven_food/screens/signup/payment-method-screen.dart';
import 'package:seven_food/screens/main/HomeScreen.dart';
import 'package:seven_food/screens/profile/add-card-screen.dart';
import 'package:seven_food/screens/profile/profile-screen.dart';
import 'package:seven_food/screens/purchase/purchase-details-screen.dart';
import 'package:seven_food/screens/qr-screens/qr-screen.dart';
import 'package:seven_food/screens/qr-screens/scan-indexes-screen.dart';
import 'package:seven_food/screens/technical-support/support-screen.dart';
import 'package:seven_food/widgets/custom-elevation.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreen();
}

/// This is the private State class that goes with MyStatefulWidget.
class _IndexScreen extends State<IndexScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HistoryScreen(), //DetailHistory(),
    Text(
      'Index 1: ',
      style: optionStyle,
    ),
    //QRViewExample(),
    SupportScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        body: SafeArea(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CustomElevation(
          width: 65,
          height: 65,
          child: FloatingActionButton(
            onPressed: () {
              //_onItemTapped(2);
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => QRIndex())//PurchaseDetailsScreen())//QRViewExample())

              );
            },
            backgroundColor: Color.fromRGBO(71, 83, 109, 1),
            child: Icon(
              Icons.qr_code_scanner,
              size: 33,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Padding(
            padding: EdgeInsets.only(left: 0, right: 0, top: 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      _onItemTapped(0);
                    },
                    icon: Icon(
                      Icons.home,
                      color: _selectedIndex == 0
                          ? Color.fromRGBO(47, 130, 210, 1)
                          : Color.fromRGBO(71, 83, 109, 1),
                    )),
                IconButton(
                  onPressed: () {
                    _onItemTapped(1);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: _selectedIndex == 1
                        ? Color.fromRGBO(47, 130, 210, 1)
                        : Color.fromRGBO(71, 83, 109, 1),
                  ),
                ),
                SizedBox(),
                IconButton(
                    onPressed: () {
                      _onItemTapped(3);
                    },
                    icon: Icon(
                      Icons.message,
                      color: _selectedIndex == 3
                          ? Color.fromRGBO(47, 130, 210, 1)
                          : Color.fromRGBO(71, 83, 109, 1),
                    )),
                IconButton(
                    onPressed: () {
                      _onItemTapped(4);
                    },
                    icon: Icon(
                      Icons.person,
                      color: _selectedIndex == 4
                          ? Color.fromRGBO(47, 130, 210, 1)
                          : Color.fromRGBO(71, 83, 109, 1),
                    )),
              ],
            ),
          ),
        )
        // BottomNavigationBar(
        //   showSelectedLabels: false,
        //   showUnselectedLabels: false,
        //   backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        //   unselectedItemColor: Color.fromRGBO(71, 83, 109, 1),
        //   items:  <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home, ),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.shopping_cart, ),
        //       label: 'Shopping Cart',
        //     ),
        //     // BottomNavigationBarItem(
        //     //   icon: FloatingActionButton(
        //     //     onPressed: () {
        //     //     },
        //     //     child: Icon(Icons.qr_code_scanner),
        //     //   ),
        //     //   label: 'QR'
        //     // ),
        //
        //
        //     // BottomNavigationBarItem(
        //     //     icon: Container( width: 25,),
        //     //     label: 'cont'
        //     // ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.message, ),
        //       label: 'Message',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person, ),
        //       label: 'Personal'
        //     )
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Color.fromRGBO(47, 130, 210, 1),
        //   onTap: _onItemTapped,
        // ),
        );
  }
}
